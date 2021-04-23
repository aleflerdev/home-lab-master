Enable ssh-agent powershell

```
Get-Service ssh-agent | Set-Service -StartupType Manual
Get-service ssh-agent | Start-Service
```

Then to make sure it's running

```
> Get-Service ssh-agent | select *

Name                : ssh-agent
RequiredServices    : {}
CanPauseAndContinue : False
CanShutdown         : False
CanStop             : True
DisplayName         : OpenSSH Authentication Agent
DependentServices   : {}
MachineName         : .
ServiceName         : ssh-agent
ServicesDependedOn  : {}
ServiceHandle       : SafeServiceHandle
Status              : Running
ServiceType         : Win32OwnProcess
StartType           : Manual
```