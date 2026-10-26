#!/bin/bash
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.local/share/visualteam-nas-link"
mkdir -p "$DEST"
cp "$DIR/nas-link-copy.sh" "$DEST/nas-link-copy.sh"
chmod +x "$DEST/nas-link-copy.sh"
echo "설치 완료. Automator 빠른 동작에서 다음 명령을 사용하세요:"
echo '"$HOME/.local/share/visualteam-nas-link/nas-link-copy.sh" "$@"'
