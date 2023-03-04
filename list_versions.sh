#!/usr/bin/bash
set -euo pipefail
shopt -s failglob
IFS=$'\t\n'
warn() { printf '\E[1m[warn]\E[0m %s\n' "$*"; } >&2
list_pkgver() (
  local ver=pkgver rel=pkgrel
  for pkgbuild in "${@#./}"; do
    unset pkgname pkgver pkgrel
    # shellcheck source=/dev/null
    source "$pkgbuild" # || true
    [[ -v pkgname ]] || warn "$pkgbuild no pkgname"
    printf '%s\t%s-%d\n' "${pkgbuild%/*}" "${!ver}" "${!rel}"
  done
)

list_pkgver ./*/PKGBUILD | column -t
