#!/usr/bin/env python3

import subprocess
import i3ipc
import re

i3 = i3ipc.Connection()

def get_scratchpad_windows():
    """Getting scratchpad Windows"""

    scratchpad_containers = i3.get_tree().scratchpad().descendents()
    return filter(lambda c: c.type == 'con' and c.id, scratchpad_containers) # return them in id

def rofi_choose(options):
    # Show rofi in dmenu mode
    title, _id = map(list, zip(*options)) # we split the nested list into 2 and use the title list on rofi
    rofi_process = subprocess.Popen(["rofi", "-dmenu", "-format", "i", "-p", "App: ", "-theme", "/home/strixx/Scripts/Rofi-Scripts/Rofi.rasi"], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

    # Pipe our windows through rofi, rofi will always output a order number for the list
    stdoutdata, _ = rofi_process.communicate("\n".join(title).encode())
    return int(stdoutdata.decode('utf-8').replace("\n", '')) # We get the number output and make sure its a int

def use_xprop(x):
    """Get property for our x(id)"""
    process = subprocess.Popen(["xprop", "-id", " {}".format(x) ], stdout=subprocess.PIPE)
    proc_stdout = process.communicate()[0].strip()

    # Name
    name = re.search('(?:WM_NAME.+? = )("[A-z].+?")', str(proc_stdout))

    # App
    app = re.search('(?:WM_CLASS.+?,)(.+?.")', str(proc_stdout))
    app = re.search('".*', app.group(1))

    string = "{} | {}".format(app.group().strip('"'), name.group(1).strip('"'))
    return string

def main():
    """Main function"""
    window_titles = []
    for x in get_scratchpad_windows():
        y = []
        y.extend((use_xprop(x.window), x.id))
        window_titles.append(y)

    if window_titles: # If there are windows in scratchpad , run rofi_choose
        window_to_restore = rofi_choose(window_titles)
        i3.command('[con_id="{}"] scratchpad show'.format(window_titles[window_to_restore][1])) # use rofi int output so we can slice the list


if __name__ == '__main__':
    main()
