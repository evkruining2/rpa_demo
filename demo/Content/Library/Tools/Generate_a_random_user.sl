namespace: Tools
flow:
  name: Generate_a_random_user
  workflow:
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: 'https://randomuser.me/api/?format=json'
            - auth_type: anonymous
        publish:
          - json_result: '${return_result}'
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: on_failure
    - json_path_query:
        do:
          io.cloudslang.base.json.json_path_query:
            - json_object: '${json_result}'
            - json_path: "${'$.results[0].'+result_string}"
        publish:
          - return_result: "${return_result.strip('\"')}"
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: on_failure
    - list_iterator:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: 'name.first,name.last,gender'
            - separator: ','
        publish:
          - result_string
        navigate:
          - HAS_MORE: json_path_query
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      http_client_get:
        x: 51
        'y': 71
      json_path_query:
        x: 115
        'y': 265
      list_iterator:
        x: 215
        'y': 76
        navigate:
          ded01f09-d46f-fbed-0dbd-4994267eb47b:
            targetId: 873bc099-b3a1-dae7-bfbd-ceda5240c7d2
            port: NO_MORE
    results:
      SUCCESS:
        873bc099-b3a1-dae7-bfbd-ceda5240c7d2:
          x: 439
          'y': 64
