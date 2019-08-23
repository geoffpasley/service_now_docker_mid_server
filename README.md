# ServiceNow Mid Server

Windows Core container for a ServiceNow Mid Server.
This is for the New York version of ServiceNow. The <b>sn_file_url</b> environment variable in the DockerFile can be changed to another Mid Server download .zip URL if needed. I've tested with London, Madrid, and New York and all seem to work as expected.


## Build from docker file

```
git clone https://github.com/tkojames24/SNMidServer.git
cd sn-mid-server
docker build -t sn-mid-server .
```

## How to use this image

### start a MID Server instance

This image includes EXPOSE 80 (the web services port)

```
docker run -d --name demonightlyeureka \
  -e 'SN_URL=demonightlyeureka' \
  -e 'SN_USER=admin' \
  -e 'SN_PASSWD=admin' \
  -e 'SN_MID_NAME=my_mid' \
  toolsproservia/sn-mid-server
```

