#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

"$SCRIPT_DIR/setup_paru.sh"

PACKAGES=(
    # base
    "nodejs"
    "npm"
    # ides
    "webstorm"
)

paru -S --needed --noconfirm "${PACKAGES[@]}"

