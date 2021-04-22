namespace: RPA_Challenge
operation:
  name: Download_Workload
  inputs:
    - xls_location
    - local_file
    - proxy:
        required: false
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute(xls_location,local_file, proxy):
          # code goes here
          import urllib.request

          if proxy:
              proxy = urllib.request.ProxyHandler({'http': proxy})
              opener = urllib.request.build_opener(proxy)
              urllib.request.install_opener(opener)
              urllib.request.urlretrieve(xls_location, local_file)
          else:
              urllib.request.urlretrieve(xls_location, local_file)
  results:
    - SUCCESS
