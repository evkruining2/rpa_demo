namespace: Readout_Meters
flow:
  name: test_vars
  workflow:
    - set_vars:
        do:
          Readout_Meters.set_vars:
            - line: 'arie,gerrit,sjaak,willem'
        publish:
          - a
          - b
          - c
          - d
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      set_vars:
        x: 158
        'y': 96
        navigate:
          a4554dee-0215-c28c-c786-e95335f33f31:
            targetId: 0855026a-a2cd-d3ad-5fb6-e805883a23d8
            port: SUCCESS
    results:
      SUCCESS:
        0855026a-a2cd-d3ad-5fb6-e805883a23d8:
          x: 345
          'y': 98
