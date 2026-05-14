#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

"$SCRIPT_DIR/setup_paru.sh"

PACKAGES=(
    # ide
    "rider"
    # runtimes
    "dotnet-runtime"
    "asp-runtime"
    # sdk stuff
    "dotnet-sdk"
    "dotnet-host"
    "dotnet-targeting-pack"
)

paru -S --needed --noconfirm "${PACKAGES[@]}"

