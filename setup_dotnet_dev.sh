#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

"$SCRIPT_DIR/setup_paru.sh"

PACKAGES=(
    # sdk stuff
    "dotnet-sdk"
    "dotnet-host"
    "dotnet-targeting-pack"
    # runtimes
    "dotnet-runtime"
    "aspnet-runtime"
    # ides
    "rider"
)

paru -S --needed --noconfirm "${PACKAGES[@]}"

