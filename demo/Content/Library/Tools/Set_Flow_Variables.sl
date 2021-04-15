namespace: Tools
operation:
  name: Set_Flow_Variables
  inputs:
    - list
  python_action:
    use_jython: false
    script: |-
      # do not remove the execute function
      def execute(list):
          # code goes here
          gender,name.title,name.first,name.last,location.street.number,location.street.name,location.city,location.state,location.country,location.postcode,location.coordinates.latitude,location.coordinates.longitude,location.timezone.offset,location.timezone.description,email,login.uuid,login.username,login.password,login.salt,login.md5,login.sha1,login.sha256,dob.date,dob.age,registered.date,registered.age,phone,cell,id.name,id.value,picture.large,picture.medium,picture.thumbnail,nat = line.split(',',33)
      # you can add additional helper methods below.
  outputs:
    - gender
    - name.title
    - name.first
    - name.last
    - location.street.number
    - location.street.name
    - location.city
    - location.state
    - location.country
    - location.postcode
    - location.coordinates.latitude
    - location.coordinates.longitude
    - location.timezone.offset
    - location.timezone.description
    - email
    - login.uuid
    - login.username
    - login.password
    - login.salt
    - login.md5
    - login.sha1
    - login.sha256
    - dob.date
    - dob.age
    - registered.date
    - registered.age
    - phone
    - cell
    - id.name
    - id.value
    - picture.large
    - picture.medium
    - picture.thumbnail
    - nat
  results:
    - SUCCESS
