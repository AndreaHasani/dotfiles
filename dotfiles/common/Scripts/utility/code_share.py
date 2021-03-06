import sys
import urllib.parse
import urllib.request
from docopt import docopt

__doc__ = """Pasteee -- Paste something to paste.ee

Usage:
    pasteee [options] [<file>]
    pasteee -h | --help

Options:
    -d <text> --description=<text>    Set description
    -h --help                         Show this screen.
    -l <lang> --language=<lang>       Set language
    -p --private                      Paste privately

"""

def die(msg):
    print(msg, file=sys.stderr)
    return 1

def send_paste(txt, description, private, lang):
    data = urllib.parse.urlencode({
        "key": "public",
        "description": description,
        "language": lang,
        "paste": txt,
        "private": private,
        "format": "simple",
        "return": "link"}).encode()
    link = urllib.request.urlopen("http://paste.ee/api", data).read().decode()

    if link == "error_invalid_language":
        return die("Invalid language")
    elif link == "error_no_paste":
        return die("Paste failed.")

    print(link)
    return 0

def main():
    args = docopt(__doc__)
    if args["--language"] == None:
        language = "plain"
    else:
        language = args["--language"]
    if args["--private"] == False:
        private = 0
    else:
        private = 1
    if args["--description"] == None:
        description = ""
    else:
        description = args["--description"]

    if args["<file>"] == None:
        txt = sys.stdin.read()
    else:
        try:
            with open(args["<file>"], 'r') as f:
                txt = f.read()
        except OSError as error:
            return die("Could not open " + error.filename)

    if len(txt) < 1:
        return die("Nothing to send.")

    return send_paste(txt, description, private, language)

if __name__ == "__main__":
    sys.exit(main())
