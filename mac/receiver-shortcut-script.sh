#!/bin/bash
set -euo pipefail
TARGET="$(/bin/cat)"
PREFIX="/Volumes/SND/Masmarulez"
case "$TARGET" in
  "$PREFIX"|"$PREFIX/"*) ;;
  *) /usr/bin/osascript -e 'display alert "허용되지 않은 NAS 경로입니다"'; exit 1 ;;
esac
case "$TARGET" in
  *"/../"*|*"/./"*|*$'\n'*|*$'\r'*|*$'\0'*) exit 1 ;;
esac
REL="${TARGET#"$PREFIX"}"
for ROOT in "/Volumes/SND/Masmarulez" "/Volumes/Masmarulez"; do
  CANDIDATE="$ROOT$REL"
  if [[ -d "$CANDIDATE" ]]; then
    /usr/bin/open "$CANDIDATE"
    exit 0
  fi
done
/usr/bin/osascript -e 'display alert "폴더를 찾을 수 없습니다" message "NAS 연결 상태와 실제 폴더 경로를 확인해 주세요."'
exit 1
