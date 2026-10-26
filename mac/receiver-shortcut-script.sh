#!/bin/bash
set -euo pipefail
TARGET="$(/bin/cat)"
ROOT='/Volumes/SND/Masmarulez/'
case "$TARGET" in "${ROOT%/}"|"$ROOT"*) ;; *) /usr/bin/osascript -e 'display alert "허용되지 않은 NAS 경로입니다"'; exit 1;; esac
case "$TARGET" in *'/../'*|*'/./'*|*$'\n'*|*$'\r'*) exit 1;; esac
if [[ ! -d "$TARGET" ]]; then /usr/bin/osascript -e 'display alert "폴더를 찾을 수 없습니다" message "NAS(SND)가 연결돼 있는지 확인해 주세요."'; exit 1; fi
/usr/bin/open -- "$TARGET"
