#!/bin/bash
# Builds the PineappleTAK module package for the WiFi Pineapple Tetra: Pineapple-TetraTAK-<version>.tar.gz
# Run from the repository root:  tools/build-module.sh
# The package unpacks into /pineapple/modules/ as PineappleTAK/.
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VER=$(sed -n 's/^PTAK_VERSION="\(.*\)"/\1/p' "$ROOT/pineappletak/pineappletak.sh")
INFO_VER=$(sed -n 's/.*"version": *"\(.*\)".*/\1/p' "$ROOT/module/PineappleTAK/module.info")
[ "$VER" = "$INFO_VER" ] || { echo "Version mismatch: pineappletak.sh $VER, module.info $INFO_VER" >&2; exit 1; }
OUT="$ROOT/Pineapple-TetraTAK-$VER.tar.gz"
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
cp -a "$ROOT/module/PineappleTAK" "$TMP/PineappleTAK"
# the service goes inside the module, without caches or your data
cp -a "$ROOT/pineappletak" "$TMP/PineappleTAK/pineappletak"
find "$TMP/PineappleTAK" \( -name __pycache__ -o -name '*.pyc' \) -prune -exec rm -rf {} +
rm -f "$TMP/PineappleTAK/pineappletak/core/certs/"*.pem "$TMP/PineappleTAK/pineappletak/core/certs/"*.p12 \
      "$TMP/PineappleTAK/pineappletak/core/web/auth"
chmod 755 "$TMP/PineappleTAK/install.sh"
tar -C "$TMP" --owner=0 --group=0 -czf "$OUT" PineappleTAK
ls -l "$OUT"
