# escape=`

# Copyright (C) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license. See LICENSE.txt in the project root for license information.

ARG FROM_IMAGE=microsoft/dotnet-framework:3.5-sdk-windowsservercore-1709
FROM ${FROM_IMAGE}

# Reset the shell.
SHELL ["cmd", "/S", "/C"]

# Set up environment to collect install errors.
COPY Install.cmd C:\TEMP\
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

# Install Node.js LTS
ADD https://nodejs.org/dist/v8.11.3/node-v8.11.3-x64.msi C:\TEMP\node-install.msi
RUN start /wait msiexec.exe /i C:\TEMP\node-install.msi /l*vx "%TEMP%\MSI-node-install.log" /qn ADDLOCAL=ALL

# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/16/release/channel
ADD ${CHANNEL_URL} C:\TEMP\VisualStudio.chman

# Download and install Build Tools for Visual Studio 2019 for native desktop workload.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\TEMP\VisualStudio.chman `
    --installChannelUri C:\TEMP\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended `
    --add Microsoft.VisualStudio.Component.VC.14.20.ATL `
    --installPath C:\BuildTools

# Install Windows 8.1 SDK
ADD https://go.microsoft.com/fwlink/p/?LinkId=323507 C:\TEMP\sdksetup.exe
RUN C:\TEMP\sdksetup.exe /quiet

RUN fsutil behavior set SymlinkEvaluation R2R:1

# Use developer command prompt and start PowerShell if no other command specified.
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
