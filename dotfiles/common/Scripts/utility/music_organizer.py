import sys
import os
import shutil

torrent_name = sys.argv[1]
torrent_dir = sys.argv[2]
fullPath = "{}/{}".format(torrent_dir, torrent_name)
musicExtension = ["flac", "mp3"]

def organize_file():
    count = 0
    for root, dirpath, filenames in os.walk(fullPath):
        for files in filenames:
            for extensions in musicExtension:
                if extensions in files:
                    if count == 4:
                       shutil.move(fullPath, "/home/strixx/Music/High Quality Music/")
                       return
                    else:
                        count += 1


organize_file()

