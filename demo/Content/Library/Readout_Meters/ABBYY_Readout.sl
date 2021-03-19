namespace: Readout_Meters
flow:
  name: ABBYY_Readout
  inputs:
    - file: "c:\\Temp\\kodi.png"
  workflow:
    - process_image:
        do:
          io.cloudslang.abbyy.cloud.v1.process_image:
            - location_id: cloud-eu
            - application_id: 3f224af9-d692-45d1-a009-9978ffc2c5f6
            - password:
                value: w+5DgDVtKqI0mu6aZu+bT3Q+
                sensitive: true
            - source_file: '${file}'
            - export_format: txt
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      process_image:
        x: 185
        'y': 139
        navigate:
          60ec5ace-a01f-727c-dc2a-05cb550bf322:
            targetId: 16194661-a35e-dd55-b38b-a2d9d7d4cd86
            port: SUCCESS
    results:
      SUCCESS:
        16194661-a35e-dd55-b38b-a2d9d7d4cd86:
          x: 462
          'y': 143
