param(
	[string]$config_file = "C:\agent\config.xml", 
	[string]$url = $env:sn_url, 
	[string]$username = $env:sn_username, 
	[string]$password = $env:sn_password, 
	[string]$mid_server_name = $env:sn_mid_server_name
)

function check-variables
{
    $e = $false;

    if($url -eq "" -or $username -eq "" -or $password -eq "" -or $mid_server_name -eq "")
    {
        $e = $true;
    }

    return $e;
}

function update-config-file
{
    $e = check-variables;

    if($e)
    {
        Write-Host "You must provide all environment variables to build config.xml file." -ForegroundColor Red;
    }
    else
    {
        try
        {
            COPY C:\asset\config.xml C:\agent\;
	        [xml]$myXML = Get-Content $config_file
	        $myXML.parameters.ChildNodes.Item(2).value = $url;
	        $myXML.parameters.ChildNodes.Item(4).value = $username;
	        $myXML.parameters.ChildNodes.Item(5).value = $password;
	        $myXML.parameters.ChildNodes.Item(7).value = $mid_server_name;

	        $myXML.Save($config_file);
            Write-Host "Configuration file built." -ForegroundColor Green;
        }
        catch
        {
            $e = $true;
        }
    }

    return $e;
}

$error = $false;

if(!(Test-Path $config_file))
{
	$error = update-config-file;
}

if(!$error)
{
    Write-Host "Conecting to: $url";
    Write-Host "Mid Server name: $mid_server_name";
    Write-Host "";

    cd C:\agent\
    .\start.bat

    Write-Host "Container Started..." -ForegroundColor Green;

    while (0 -eq 0)
    {
        Start-Sleep -s 10;
    }
}