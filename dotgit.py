import os
import argparse
from socket import gethostname
import os
from datetime import datetime
from hashlib import md5
import shutil
import pdb
from itertools import zip_longest


# parser = argparse.ArgumentParser(description="Use arguments below.")
# parser.add_argument("-f", "--file", required=True, dest="filename" )
# parser.add_argument("-F", "--force", dest="force" )
# parser.add_argument("-d", "--dir", required=True, dest="pathdir" )

# args = parser.parse_args()

# Variables

# force, filename, pathdir =  args.force, args.filename, args.pathdir

userHome = "/home/strixx/"
dotfilesPath = "/home/strixx/.dotfiles/"
verbose = 0
debug = 0
restore = 1
symlink = 1
host = os.uname()[1]

def init_check():
    """Check if dotfilesPath tree is not empty and has correct folders"""

    if not os.listdir(dotfilesPath):
        print("Directory variable empty, are you sure this is the right directory if so, \n")
        answer = input("Do you want to setup dotfiles in this directory? ")
        if "y" not in answer.lower():
            return False

    if not verbose:
        if not os.path.exists(dotfilesPath + 'filelist'):
            with open(dotfilesPath + 'filelist', 'a'):
                os.utime(dotfilesPath + 'filelist', None)

        if not os.path.exists(dotfilesPath + 'dotfiles'):
            os.makedirs(dotfilesPath + 'dotfilesPath')
            os.makedirs(dotfilesPath + 'dotfilesPath/common')
            os.makedirs(dotfilesPath + 'dotfilesPath/' + host)
        else:
            if not os.path.exists(dotfilesPath + 'filelist'):
                print("Creating file in: " + dotfilesPath + "filelist")

        if not os.path.exists(dotfilesPath + 'dotfiles'):
            print("Creating directory in: " + dotfilesPath + 'dotfilesPath')
            print("Creating directory in: " + dotfilesPath + 'dotfilesPath/common')
            print("Creating directory in: " + dotfilesPath + 'dotfilesPath/' + host)

    return True

def check_path(path, hostname=None, home=None):
    if not home:
        fullpath = "{}{}/{}".format(dotfilesPath, hostname, path)
    if home:
        fullpath = "{}{}".format(userHome, path)
    if os.path.exists(fullpath):
        if os.path.isdir(fullpath):
            names = []
            for root, _, files in os.walk(fullpath):
                for name in files:
                    names.append(root + "/" + name)
            return names
        else:
            return fullpath
    return fullpath

def symlink_files(src, hostname):
    """Symlink function, use src to symlink to dest"""

    workingPath = dotfilesPath + "dotfiles/" + hostname + "/"
    if workingPath in src:
        dest = src.replace(dotfilesPath + "dotfiles/" + hostname + "/", userHome)
    else:
        dest = src.replace(userHome, dotfilesPath + "dotfiles/" + hostname + "/")

    if verbose:
        print("Symlink: {} | {}".format(src,dest))
        return

    try:
        os.symlink(src, dest)
        if verbose:
            print("Making symbolic link: " + dest)

    except Exception as e:
        os.makedirs(os.path.dirname(dest))

def file_changes(localPath, workingPath, hostname="common"):

    if restore:
        exists_gPath = os.path.exists(workingPath)
        exists_lPath = os.path.exists(workingPath.replace(dotfilesPath + "dotfiles/" + hostname + "/", userHome))
    else:
        exists_lPath = os.path.exists(localPath)
        exists_gPath = os.path.exists(localPath.replace(userHome, dotfilesPath + "dotfiles/" + hostname + "/"))


    if exists_lPath and exists_gPath and not symlink:


        # Making hash to compare
        git_hash = hash_md5(workingPath)
        local_hash = hash_md5(localPath)

        if restore and git_hash not in local_hash:
            os.remove(localPath)
            shutil.copy2(workingPath, localPath)
        if not restore and git_hash not in local_hash:
            os.remove(workingPath)
            shutil.copy2(localPath, workingPath)
        return


    if restore and not exists_lPath and exists_gPath:
        if symlink:
            symlink_files(workingPath, hostname)
            return

        try:
            shutil.copy2(workingPath, localPath)
        except IOError as e:
            # try creating parent directories
            os.makedirs(os.path.dirname(localPath), exist_ok=True)
            shutil.copy2(workingPath, localPath)
        return

    if not restore and not exists_lPath and exists_gPath:
        os.remove(workingPath)
        return

    if exists_lPath and not exists_gPath:

        try:
            shutil.copy2(localPath, workingPath)
        except IOError as e:
            # try creating parent directories
            os.makedirs(os.path.dirname(workingPath), exist_ok=True)
            shutil.copy2(localPath, workingPath)
        return

    if not exists_lPath and not exists_gPath:
        print("Path doesn't exist: '{}'".format(localPath))
        return

def changes_check():
    """Checking if there any any files changes via md5, if so return that file path"""

    with open(dotfilesPath + "filelist", mode='r') as f:
        for path in f.readlines():
            path = path.replace('\n', '')
            if path:
                if ':' not in path:

                    working_path = check_path(path, "dotfiles/common")
                    local_path = check_path(path, home=1)
                    if type(working_path) == list:
                        for l_path, w_path in zip_longest(local_path, working_path):
                            file_changes(l_path, w_path)
                    else:
                        file_changes(local_path, working_path)

                else:
                    path, hostname = path.split(':')
                    if hostname in host:
                        working_path = check_path(path, "dotfiles/" + hostname)
                        local_path = check_path(path, home=1)
                        if type(working_path) == list or type(local_path) == list:
                            for l_path, w_path in zip_longest(local_path, working_path):
                                file_changes(l_path, w_path, hostname)
                        else:
                            file_changes(local_path, working_path, hostname)


def hash_md5(fname):
    hash_md5 = md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


if __name__ == "__main__":
    if init_check():

        print("UserHome: '{}'".format(userHome))
        print("DotfilesPath: '{}'".format(dotfilesPath))
        print("Verbose: " + str(verbose))
        print("Debug: " + str(debug))
        print("Restore: " + str(restore))
        print("Symlink: " + str(symlink))
        print("Host: " + host)

        answer = input("Do you want to contiunue? ")
        if "y" in answer.lower():
            changes_check()
