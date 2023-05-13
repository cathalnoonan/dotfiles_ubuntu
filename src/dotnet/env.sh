#!/usr/bin/env bash

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_NOLOGO=true
export DOTNET_NUGET_SIGNATURE_VERIFICATION=false

##
# Include dotnet tools folder in PATH
##
if [[ "$PATH" != *"/.dotnet/tools"* ]]; then
    export PATH="$PATH:$HOME/.dotnet/tools"
fi
