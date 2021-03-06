import subprocess as sub
import json
from random import randint

current_workspace = sub.Popen(['i3-msg', '-t', 'get_workspaces'], stdout=sub.PIPE)

out, err = current_workspace.communicate()
try:
    result = json.loads(out.decode('utf-8'))

except Exception:
    print('command error')

for item in result:
    if item['visible'] and item['focused']:
        workspace = item['name'][2::]

current_marks = sub.Popen(['i3-msg', '-t', 'get_marks'], stdout=sub.PIPE)
out, err = current_marks.communicate()

try:
    result = json.loads(out.decode('utf-8'))

except Exception:
    print('Command Error')


total_marks = []

for mark in result:
    if workspace.strip() in mark:
        # num = re.findall(r'\d', mark)
        num = mark.split('_')
        total_marks.append(int(num[1]))

def find_new_num(mark_nums):
    for num in range(1, 1000):
	    if num not in mark_nums:
		    return num


mark_name = workspace + '_' + str(find_new_num(total_marks))
print(mark_name)
sub.Popen(['i3-msg', 'mark', mark_name], stdout=sub.PIPE)
