namespace: RPA_Challenge
flow:
  name: RPA_Challenge
  inputs:
    - xls_file: "c:\\Temp\\challenge.xlsx"
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: '${xls_file}'
            - worksheet_name: Sheet1
            - has_header: 'yes'
            - row_index: '1:10'
        publish:
          - header
          - return_result
          - rows_count
        navigate:
          - SUCCESS: list_iterator
          - FAILURE: on_failure
    - list_iterator:
        do:
          io.cloudslang.base.lists.list_iterator:
            - list: '${return_result}'
            - separator: '|'
        publish:
          - row: '${result_string}'
        navigate:
          - HAS_MORE: Set_Flow_Variables
          - NO_MORE: SUCCESS
          - FAILURE: on_failure
    - Set_Flow_Variables:
        do:
          RPA_Challenge.Set_Flow_Variables:
            - lines: '${row}'
        publish:
          - a
          - b
          - c
          - d
          - e
          - f
          - g
        navigate:
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_cell:
        x: 93
        'y': 76
      list_iterator:
        x: 252
        'y': 80
        navigate:
          b8c0b22a-f31b-4b8f-3902-b6f4ac716c02:
            targetId: f657841e-7ee0-eb42-9468-e8af0c8071f3
            port: NO_MORE
      Set_Flow_Variables:
        x: 261
        'y': 272
        navigate:
          6b80c679-2edb-058e-80d7-54aa22f92118:
            targetId: f657841e-7ee0-eb42-9468-e8af0c8071f3
            port: SUCCESS
    results:
      SUCCESS:
        f657841e-7ee0-eb42-9468-e8af0c8071f3:
          x: 535
          'y': 167
