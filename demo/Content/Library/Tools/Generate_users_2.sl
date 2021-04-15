namespace: Tools
flow:
  name: Generate_users_2
  inputs:
    - number_of_users: '20'
    - nationality: 'nl,us'
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: "${'https://randomuser.me/api/?format=csv&nat='+nationality+'&results='+number_of_users}"
            - auth_type: anonymous
        publish:
          - json_result: '${return_result}'
        navigate:
          - SUCCESS: write_to_file
          - FAILURE: on_failure
    - write_to_file:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: "c:\\Temp\\users.csv"
            - text: '${json_result}'
            - encode_type: utf_8
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      http_client_get:
        x: 88
        'y': 74
      write_to_file:
        x: 280
        'y': 250
        navigate:
          bae51a8c-393f-3727-a888-f2bd5054c535:
            targetId: 17c290db-cae9-a690-7bba-72d6c17aa2c0
            port: SUCCESS
    results:
      SUCCESS:
        17c290db-cae9-a690-7bba-72d6c17aa2c0:
          x: 428
          'y': 58
