namespace: Looptest
flow:
  name: loop_test
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: "c:\\names.xls"
            - worksheet_name: Sheet1
            - row_delimiter: ','
            - column_delimiter: '|'
        publish:
          - return_result
        navigate:
          - SUCCESS: do_nothing
          - FAILURE: on_failure
    - do_nothing:
        loop:
          for: line in return_result
          do:
            io.cloudslang.base.utils.do_nothing:
              - input_0: '${line}'
          break:
            - FAILURE
          publish:
            - output_0: '${input_0}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      do_nothing:
        x: 331
        'y': 308
        navigate:
          bc8a9bd4-4643-6608-1305-da98f58c9434:
            targetId: 9f87ae74-dc94-20ce-30e6-1158a870a47a
            port: SUCCESS
      get_cell:
        x: 154
        'y': 117
    results:
      SUCCESS:
        9f87ae74-dc94-20ce-30e6-1158a870a47a:
          x: 504
          'y': 185
