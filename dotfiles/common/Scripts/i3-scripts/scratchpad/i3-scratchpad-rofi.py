#!/usr/bin/env python3

"""
python script for using scrachpad specific for workspace. Made to use with set_marks script

i3ipc module needed

"""

import subprocess
import i3ipc
import re

i3 = i3ipc.Connection()

scratchpad_workspace = i3.get_workspaces()


def find_focused_work(workspace):
    for i, item in enumerate(workspace):
        if item['focused']:
            return workspace[i]['name'].split(':')[1]


current_workspace = find_focused_work(scratchpad_workspace)


def get_scratchpad_windows():
    """Getting scratchpad Windows"""

    scratchpad_containers = i3.get_tree().scratchpad().descendents()
    # return them in id
    return filter(lambda c: c.type == 'con' and current_workspace.strip() in str(c.marks), scratchpad_containers)


def rofi_choose(options):
    # Show rofi in dmenu mode
    # we split the nested list into 2 and use the title list on rofi
    title, _id = map(list, zip(*options))
    rofi_process = subprocess.Popen(["rofi", "-dmenu", "-format", "i", "-p", "App: ", "-theme",
                                     "/home/strixx/Scripts/Rofi-Scripts/Rofi.rasi"], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

    try:
        # Pipe our windows through rofi, rofi will always output a order number for the list
        stdoutdata, _ = rofi_process.communicate("\n".join(title).encode())
        # We get the number output and make sure its a int, return the choose int 1, 2, 4 x
        return int(stdoutdata.decode('utf-8').replace("\n", ''))
    except Exception:
        return


def use_xprop(x, get_id=False):
    """Get property for our x(id)"""
    process = subprocess.Popen(
        ["xprop", "-id", " {}".format(x)], stdout=subprocess.PIPE)
    proc_stdout = process.communicate()[0].strip()

    # Name
    name = re.search('(?:WM_NAME.+? = )("[A-z].+?")', str(proc_stdout))

    # App
    app = re.search('(?:WM_CLASS.+?,)(.+?.")', str(proc_stdout))
    app = re.search('".*', app.group(1))

    # Id

    string = "{} | {}".format(app.group().strip('"'), name.group(1).strip('"'))
    if get_id:
        _id = re.search('(?:_NET_WM_PID.+? = )(\d+)',
                        str(proc_stdout), re.MULTILINE)
        return _id.group(1)
    else:
        return string


def main():
    """Main function"""
    window_titles = []
    window_action_id = []
    for x in get_scratchpad_windows():
        window_titles.append([use_xprop(x.window), x.id])
        window_action_id.append([use_xprop(x.window, get_id=True), x.id])

    if window_titles:  # If there are windows in scratchpad , run rofi_choose
        window_to_restore = rofi_choose(window_titles)
        try:
            # use rofi int output so we can slice the list
            i3.command('[con_id="{}"] scratchpad show'.format(
                window_titles[window_to_restore][1]))
            subprocess.Popen(['kill', '-CONT', ' %s' %
                              window_action_id[window_to_restore][0]], stdout=subprocess.PIPE)
        except Exception:
            print("Error, i3 command didn't execute")
    else:
        subprocess.Popen(["notify-send.sh", "--replace-file=/tmp/workspacename", "Empty",
                          "-a", "Scratchpad", "-t", "1000"], stdin=subprocess.PIPE, stdout=subprocess.PIPE)


if __name__ == '__main__':
    main()
