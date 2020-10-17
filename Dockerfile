FROM mcr.microsoft.com/dotnet/core/sdk:3.1
CMD sc config aspnet_state start=auto
CMD net start aspnet_state
CMD powershell Set-ItemProperty Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\aspnet_state\Parameters -Name  AllowRemoteConnection -Value 1
CMD net stop aspnet_state
CMD net start aspnet_state
EXPOSE 42424
ENTRYPOINT ["powershell"]