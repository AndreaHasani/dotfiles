## Reading filelist and making a zip backup on backupDir

import os
import shutil
import zipfile
import subprocess

backupDir = "/home/strixx/data/linux_backup/"
tmpFolder = "/home/strixx/.tmp/tmpBackup/"

def sync():

    try:
        os.mkdir(tmpFolder)
    except Exception:
        pass

    print("Starting Sync")
    with open("list.txt", "r") as f:
        for num, path in enumerate(f.readlines()):
            path = path.strip()
            if os.path.exists(path):
                subprocess.Popen(["rsync", "-avz", "--delete", path, tmpFolder], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).wait()
    print("Finishing Sync")



def zipping():
    # Making zip file
    print("----------------------")
    print("Starting zipping")
    subprocess.Popen(["zip", "-r", backupDir + "Backup.zip", tmpFolder], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).wait()
    print("Finished zipping")
    print("Backup Complete")


if  __name__  == "__main__":
    sync()
    zipping()
