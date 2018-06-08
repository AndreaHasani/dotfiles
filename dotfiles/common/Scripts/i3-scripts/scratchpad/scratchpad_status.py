import subprocess
import i3ipc
import re

i3 = i3ipc.Connection()
scratchpad_workspace = i3.get_workspaces()

def find_focused_work(workspace):
    for i, item in enumerate(workspace):
        if item['focused']:
            return workspace[i]['name'].split(':')[1]

def get_scratchpad_windows():
    """Getting scratchpad Windows"""

    current_workspace = find_focused_work(scratchpad_workspace)
    scratchpad_containers = i3.get_tree().scratchpad().descendents()
    return filter(lambda c: c.type == 'con' and current_workspace in str(c.marks), scratchpad_containers) # return them in id

scratchpad_stats = [ x.window for x in get_scratchpad_windows() ]
print(len(scratchpad_stats))
