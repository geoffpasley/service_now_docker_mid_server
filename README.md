# ServiceNow Mid Server

Windows Core container for a ServiceNow Mid Server.
This is for the New York version of ServiceNow. The <b>sn_file_url</b> environment variable in the DockerFile can be changed to another Mid Server download .zip URL if needed. I've tested with London, Madrid, and New York and all seem to work as expected.


## Build From DockerFile

```
git clone https://github.com/geoffpasley/service_now_docker_mid_server.git
cd service_now_docker_mid_server
docker build -t geoffpasley/servicenow_mid_server .
```

## How To:

### Start a MID Server Instance

```
docker run `
  -e 'sn_url=https://INSTANCENAME.service-now.com' `
  -e 'sn_username=USERNAME' `
  -e 'sn_password=PASSWORD' `
  -e 'sn_mid_server_name=MIDSERVERNAME' `
  geoffpasley/servicenow_mid_server
```

You can also use the attached environemtn file like this:
```
docker run  `
  --env-file .\env_file.txt `
  -e 'sn_mid_server_name=MIDSERVERNAME' `
  geoffpasley/servicenow_mid_server
```