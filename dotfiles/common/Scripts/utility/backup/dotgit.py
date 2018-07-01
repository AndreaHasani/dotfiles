import argparse
import os
import sys
from hashlib import md5
import shutil
import time

from itertools import zip_longest
from subprocess import Popen
from datetime import datetime




def init_check():
    """Check if dotfilesPath tree is not empty and has correct folders"""

    if not os.path.exists(dotfilesPath + 'dotfiles'):

        print("Directory variable empty or not found, are you sure this is the right directory? \n")
        answer = input("=> Do you want to setup dotfiles in this directory? ")
        if "y" not in answer.lower():
            return False

        if verbose:
            print("Creating directory in: " + dotfilesPath + 'dotfiles')
            print("Creating directory in: " + dotfilesPath + 'dotfiles/common')
            print("Creating directory in: " + dotfilesPath + 'dotfiles/' + host)
            print("------------------------------------------------\n")
        else:
            try:
                reqDirs = [dotfilesPath + "dotfiles/common", dotfilesPath + "dotfiles/" + host]
                for reqdir in reqDirs: os.makedirs(reqdir, exist_ok=False)
                with open(dotfilesPath + 'filelist', 'a'):
                    os.utime(dotfilesPath + 'filelist', None)

            except Exception:
                return False

    return True


def get_filelist(path, hostname=None, home=None):
    if not home:
        fullpath = "{}{}/{}".format(dotfilesPath, hostname, path)
    else:
        fullpath = "{}{}".format(userHome, path)

    if os.path.isdir(fullpath):
        names = []
        for root, _, files in os.walk(fullpath):
            for name in files:
                names.append(root + "/" + name)

        return names
    else:
        return fullpath


def symlink_files(src, dest):
    """Symlink function, use src to symlink to dest"""

    if verbose:
        print("Symlink: {} | {}".format(src,dest))

    else:
        try:
            os.symlink(src, dest)
            if verbose:
                print("Making symbolic link: " + dest)

        except Exception as e:
            os.makedirs(os.path.dirname(dest))




def sync_files(localPath, workingPath):
    if verbose:
        print("Sync: {} : {}".format(workingPath, localPath))

    working_hash = hash_md5(workingPath)
    local_hash = hash_md5(localPath)

    if restore and working_hash not in local_hash:
        os.remove(localPath)
        shutil.copy2(workingPath, localPath)
    if not restore and working_hash not in local_hash:
        os.remove(workingPath)
        shutil.copy2(localPath, workingPath)

    return


def restore_files(localPath, workingPath, hostname):

    if symlink:
        symlink_files(workingPath, localPath)

    if verbose:
        print("Restoring: {} : {}".format(workingPath, localPath))

    else:
        try:
            shutil.copy2(workingPath, localPath)
        except IOError as e:
            # try creating parent directories
            os.makedirs(os.path.dirname(localPath), exist_ok=True)
            shutil.copy2(workingPath, localPath)

def add_files(localPath, workingPath):

    if verbose:
        print("Adding: {} : {}".format(localPath, workingPath))

    else:
        try:
            shutil.copy2(localPath, workingPath)

        except IOError as e:
            os.makedirs(os.path.dirname(workingPath), exist_ok=True)
            try:
                shutil.copy2(localPath, workingPath)
            except:
                pass

        if symlink:
            os.remove(localPath)
            symlink_files(workingPath, localPath)

        git_commit(workingPath)


def hard_copy(localPath, workingPath, hostname="common"):

    if restore:
        try:
            localPath = workingPath.replace(dotfilesPath + "dotfiles/" + hostname + "/", userHome)
            exists_gPath = os.path.exists(workingPath)
            exists_lPath = os.path.exists(localPath)
        except Exception:
            return
    else:
        try:
            workingPath = localPath.replace(userHome, dotfilesPath + "dotfiles/" + hostname + "/")
            exists_lPath = os.path.exists(localPath)
            exists_gPath = os.path.exists(workingPath)
        except Exception:
            os.remove(workingPath)
            return


    if exists_lPath and not exists_gPath:
        add_files(localPath, workingPath)
        return

    if exists_lPath and exists_gPath and not symlink:
        sync_files(workingPath, localPath)
        return

    if restore and not exists_lPath and exists_gPath:
        restore_files(localPath, workingPath, hostname)
        return

    if not restore and not exists_lPath and exists_gPath:
        os.remove(workingPath)
        return



def read_filelist():
    """Retrive file list from folder for both """

    try:
        with open(dotfilesPath + "filelist", mode='r') as f:
            for path in f.readlines():
                path = path.replace('\n', '')
                if path:
                    if ':' not in path:
                            working_path = get_filelist(path, "dotfiles/common")
                            local_path = get_filelist(path, home=1)

                            if type(working_path) == list:
                                for l_path, w_path in zip_longest(local_path, working_path):
                                    hard_copy(l_path, w_path)
                            else:
                                hard_copy(local_path, working_path)

                    else:
                        path, hostname = path.split(':')
                        if hostname in host:
                                working_path = get_filelist(path, "dotfiles/" + hostname)
                                local_path = get_filelist(path, home=1)
                                if type(working_path) == list or type(local_path) == list:
                                    for l_path, w_path in zip_longest(local_path, working_path):
                                        hard_copy(l_path, w_path, hostname)
                                else:
                                    hard_copy(local_path, working_path, hostname)
    except FileNotFoundError:
        print("File not found: {}filelist".format(dotfilesPath))


def hash_md5(fname):
    hash_md5 = md5()
    with open(fname, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def git_commit(workingPath):
    date = datetime.now()
    Popen(["git", "-C", os.path.dirname(workingPath), "add", "."])




if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Python script for managing dotfiles in linux.")
    parser.add_argument("-l", "--localDir",  dest="userHome", default="/home/strixx/", help="Choosing local directory to put on workdir and keep in sync with github dir.", metavar='')
    parser.add_argument("-w", "--workingDir", dest="dotfilesPath", default="/home/strixx/.dotfiles/", help="Choosing work directory where to put dotfiles for sync in github.", metavar='')
    parser.add_argument("-s", "--soft", dest="symlink", action='store_true', default=True, help="Using symbolic links from workdir to localdir, to keep them in sync")
    parser.add_argument("-r", "--restore", dest="restore", action='store_true', default=False, help="Enable restore mode, will cleanup homedir and copy all files from workDir.")
    parser.add_argument("-v", "--verbose", dest="verbose", action='store_true', default=False, help="Enable verbose mode, will print out what the script will do. Basically a dry run")
    args = parser.parse_args()

    userHome, dotfilesPath, verbose, restore, symlink =  args.userHome, args.dotfilesPath, args.verbose, args.restore, args.symlink
    host = os.uname()[1]


    print("------------------------------------------------")
    print("UserHome: '{}'".format(userHome))
    print("DotfilesPath: '{}'".format(dotfilesPath))
    print("Verbose: " + str(verbose))
    print("Restore: " + str(restore))
    print("Symlink: " + str(symlink))
    print("Host: " + host)
    print("------------------------------------------------")

    if init_check():
        answer = input("=> Do you want to contiunue? ")
        if "y" in answer.lower():
            read_filelist()
