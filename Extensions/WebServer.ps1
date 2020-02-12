Configuration WebServer
{
  param ($MachineName)

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = "Present"
      Name = "Web-Server"
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = "Present"
      Name = "Web-Asp-Net45"
    }
    #Install IIS Management Console
    WindowsFeature WebServerManagementConsole
    {
      Name = "Web-Mgmt-Console"
      Ensure = "Present"
    }
 		#Install Web Platform Installer
		Package WebPi_Installation
		{
			Ensure = "Present"
			Name = "Microsoft Web Platform Installer 5.0"
			Path = Join-Path $PSScriptRoot wpilauncher.exe
			ProductId = '4D84C195-86F0-4B34-8FDE-4A17EB41306A'
			Arguments = ''
		}

  }
} 