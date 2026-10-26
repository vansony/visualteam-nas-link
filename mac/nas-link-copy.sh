#!/bin/bash
set -euo pipefail
BASE_URL='https://vansony.github.io/visualteam-nas-link/'
if (( $# != 1 )); then /usr/bin/osascript -e 'display alert "폴더 하나만 선택해 주세요"'; exit 1; fi
TARGET="${1%/}"
if [[ "$TARGET" != /Volumes/SND/Masmarulez/* || ! -d "$TARGET" ]]; then
/usr/bin/osascript -e 'display alert "허용된 NAS 폴더가 아닙니다" message "SND/Masmarulez 아래의 폴더를 선택해 주세요."'; exit 1
fi
if [[ "$TARGET" == *'/../'* || "$TARGET" == *'/./'* || "$TARGET" == *$'\n'* || "$TARGET" == *$'\r'* ]]; then exit 1; fi
ENCODED="$(printf '%s' "$TARGET" | /usr/bin/base64 | /usr/bin/tr -d '\n' | /usr/bin/tr '+/' '-_' | /usr/bin/tr -d '=')"
URL="${BASE_URL}?p=${ENCODED}"
printf '%s' "$URL" | /usr/bin/pbcopy
/usr/bin/osascript -e 'display notification "Flow 채팅에 붙여넣으세요." with title "NAS 링크 복사 완료"' || true
printf '%s\n' "$URL"
