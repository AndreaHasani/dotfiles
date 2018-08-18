import requests as req
import sys


try:
    url = sys.argv[1]
    print(url)
except IndexError:
    print("Script run without args, please give the script an url to scrape.")
    print("Also remember to change the variables for poiting on data to scrape from x page.")




