#!/bin/bash
set -euo pipefail
BASE_URL='https://vansony.github.io/visualteam-nas-link/'
if (( $# != 1 )); then
  /usr/bin/osascript -e 'display alert "폴더 하나만 선택해 주세요"'
  exit 1
fi
TARGET="${1%/}"
case "$TARGET" in
  /Volumes/SND/Masmarulez/*) CANONICAL="$TARGET" ;;
  /Volumes/Masmarulez/*) CANONICAL="/Volumes/SND/Masmarulez/${TARGET#/Volumes/Masmarulez/}" ;;
  *) /usr/bin/osascript -e 'display alert "NAS 폴더를 확인해 주세요" message "Masmarulez 아래의 작업 폴더를 선택해 주세요."'; exit 1 ;;
esac
if [[ ! -d "$TARGET" ]] || [[ "$TARGET" == *'/../'* ]] || [[ "$TARGET" == *'/./'* ]]; then
  /usr/bin/osascript -e 'display alert "NAS 폴더를 확인해 주세요"'
  exit 1
fi
ENCODED="$(printf '%s' "$CANONICAL" | /usr/bin/base64 | /usr/bin/tr -d '\n' | /usr/bin/tr '+/' '-_' | /usr/bin/tr -d '=')"
printf '%s' "${BASE_URL}?p=${ENCODED}" | /usr/bin/pbcopy
/usr/bin/osascript -e 'display notification "Flow에 붙여넣으세요." with title "NAS 링크 복사 완료"' || true
