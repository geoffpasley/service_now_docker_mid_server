param(
	[string]$config_file = "C:\agent\config.xml", 
	[string]$url = $env:sn_url, 
	[string]$username = $env:sn_username, 
	[string]$password = $env:sn_password, 
	[string]$mid_server_name = $env:sn_mid_server_name
)

if(!(Test-Path $config_file))
{
	COPY C:\asset\config.xml C:\agent\
	[xml]$myXML = Get-Content $config_file
	$myXML.parameters.ChildNodes.Item(2).value = $url
	$myXML.parameters.ChildNodes.Item(4).value = $username
	$myXML.parameters.ChildNodes.Item(5).value = $password
	$myXML.parameters.ChildNodes.Item(7).value = $mid_server_name

	$myXML.Save($config_file)
}

cd C:\agent\
.\start.bat

ping localhost -t