import subprocess
import i3ipc

i3 = i3ipc.Connection()



def find_focused_work(workspace):
    scratchpad_workspace = i3.get_workspaces()
    for i, item in enumerate(workspace):
        if item['focused']:
            return workspace[i]['name'].split(':')[1]
current_workspace = find_focused_work(scratchpad_workspace)

    
def get_scratchpad_windows():
    """Getting scratchpad Windows"""

    scratchpad_containers = i3.get_tree().scratchpad().descendents()
    return filter(lambda c: c.type == 'con' and current_workspace in str(c.marks), scratchpad_containers) # return them in id

for x in get_scratchpad_windows():
