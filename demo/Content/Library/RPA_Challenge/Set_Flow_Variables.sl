namespace: RPA_Challenge
operation:
  name: Set_Flow_Variables
  inputs:
    - lines
  python_action:
    use_jython: false
    script: |-
      def execute():
      a,b,c,d,e,f,g = str(lines).split(',',6)
  outputs:
    - a
    - b
    - c
    - d
    - e
    - f
    - g
  results:
    - SUCCESS
