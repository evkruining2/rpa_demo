namespace: Tools
operation:
  name: JSON_to_CSV
  inputs:
    - json_result
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(json_result):\n    # code goes here\n\nimport json\n\no = json.loads(json_result) # Be careful, o must be a list, each of its objects will make a line of the csv.\n\ndef flatten(o, k='/'):\n    global l, c_line\n    if isinstance(o, dict):\n        for key, value in o.items():\n            flatten(value, k + '/' + key)\n    elif isinstance(o, list):\n        for ov in o:\n            flatten(ov, '')\n    elif isinstance(o, str):\n        o = o.replace('\\r',' ').replace('\\n',' ').replace(';', ',')\n        if not k in l:\n            l[k]={}\n        l[k][c_line]=o\n\ndef render_csv(l):\n    ftime = True\n\n    for i in range(100): #len(l[list(l.keys())[0]])\n        for k in l:\n            if ftime :\n                print('%s;' % k, end='')\n                continue\n            v = l[k]\n            try:\n                print('%s;' % v[i], end='')\n            except:\n                print(';', end='')\n        print()\n        ftime = False\n        i = 0\n\ndef json_to_csv(object_list):\n    global l, c_line\n    l = {}\n    c_line = 0\n    for ov in object_list : # Assumes json is a list of objects\n        flatten(ov)\n        c_line += 1\n    render_csv(l)\n\njson_to_csv(o)"
  results:
    - SUCCESS
