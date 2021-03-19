namespace: Readout_Meters
flow:
  name: Scan_and_OCR_Smart_Meter_Image
  inputs:
    - filename: "c:\\Temp\\p1.jpg"
  workflow:
    - tesseract_setup:
        do:
          io.cloudslang.tesseract.ocr.utils.tesseract_setup:
            - data_path: "c:\\temp"
        publish:
          - data_path_output
        navigate:
          - SUCCESS: extract_text_from_image
          - FAILURE: on_failure
    - extract_text_from_image:
        do:
          io.cloudslang.tesseract.ocr.extract_text_from_image:
            - file_path: '${filename}'
            - data_path: '${data_path_output}'
            - language: ENG
        publish:
          - text_json
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      tesseract_setup:
        x: 161
        'y': 132
      extract_text_from_image:
        x: 333
        'y': 189
        navigate:
          b2070064-cb48-1e73-698d-59d2e500c0ec:
            targetId: 8752569e-d620-c027-3b22-843789020aac
            port: SUCCESS
    results:
      SUCCESS:
        8752569e-d620-c027-3b22-843789020aac:
          x: 483
          'y': 135
