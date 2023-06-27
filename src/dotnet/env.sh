#!/usr/bin/env bash

export DOTNET_ROOT=/usr/share/.dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=true
export DOTNET_NOLOGO=true
export DOTNET_NUGET_SIGNATURE_VERIFICATION=false

##
# Include dotnet in PATH
##
export PATH="$PATH:$DOTNET_ROOT"

##
# Include dotnet tools folder in PATH
##
if [[ "$PATH" != *"$DOTNET_ROOT/tools"* ]]; then
    export PATH="$PATH:$DOTNET_ROOT/tools"
fi
