# 비주얼팀 NAS 링크 공유 (macOS + Flow)

Finder 폴더를 선택해 링크 복사 → Flow에서 HTTPS 링크 전송 → 동료가 링크 클릭 → 웹페이지에서 **Finder에서 폴더 열기** 클릭. 브라우저에서 외부 앱 실행 허용이 필요할 수 있습니다.

## 1. GitHub Pages 설정 (관리자 1회)
Repository → Settings → Pages → Build and deployment → Deploy from a branch → main / (root) → Save.

배포 예정 주소: https://vansony.github.io/visualteam-nas-link/

> 공개 URL에 폴더 경로가 **Base64 URL 인코딩**되어 들어갑니다. 이는 암호화가 아니며 링크를 받은 사람 또는 브라우저/로그 제공자가 경로를 알아낼 수 있습니다. 회사의 외부 공유 및 호스팅 정책에 맞는지 먼저 확인하세요. NAS에 대한 접근 권한은 추가되지 않습니다.

## 2. 보내는 Mac 설정 (1회)

저장소의 `mac/` 파일들을 같은 폴더에 다운로드한 뒤 터미널에서 `bash mac/install-sender.command`를 실행합니다.

Automator → 새로운 문서 → 빠른 동작 → 현재 수신 항목: **폴더**, 적용 대상: **Finder** → '셸 스크립트 실행' 추가 → 셸: `/bin/bash`, 입력 전달: **인수로** → 아래 코드 입력 후 `NAS 링크 복사`로 저장합니다.

```bash
"$HOME/.local/share/visualteam-nas-link/nas-link-copy.sh" "$@"
```

Finder에서 `/Volumes/SND/Masmarulez/` 아래 폴더 우클릭 → 빠른 동작 → NAS 링크 복사 → Flow에 붙여넣기.

## 3. 받는 Mac 설정 (각 팀원 1회)

단축어(Shortcuts) 앱에서 새 단축어를 만들고 이름을 정확히 **비주얼팀 NAS 열기**로 지정합니다.

`셸 스크립트 실행 (Run Shell Script)` 동작을 추가하고, 셸 `/bin/bash`, 입력: **단축어 입력 (Shortcut Input)**, 전달: **표준 입력(stdin)**으로 설정합니다.

`mac/receiver-shortcut-script.sh` 파일의 내용을 스크립트 동작에 복사합니다.

> 단축어 설정이나 macOS 버전에 따라 입력/셸 실행 구성이 달라질 수 있습니다. 단축어가 텍스트를 정상적으로 받고 실행할 권한이 있는지 사무실 Mac에서 테스트하세요.

## 지원 경로
- `/Volumes/SND/Masmarulez/...` (동료의 Mac에도 같은 마운트 경로가 있어야 함)
- NAS의 Bonjour SMB 이름은 `snd._smb._tcp.local`이며 링크 실행은 마운트된 `/Volumes/SND` 폴더를 기준으로 합니다.
- NAS가 `SND-1` 등 다른 이름으로 연결된 Mac에서는 수정이 필요합니다.

## 실제 제한
- Flow가 `file://` 및 `smb://`를 일반 텍스트로 표시하므로 HTTPS 페이지를 거칩니다.
- 링크 클릭만으로 바로 Finder를 연다고 보장할 수 없습니다. 페이지 버튼과 브라우저 허용 과정이 필요할 수 있습니다.
- GitHub Pages 배포와 실제 회사 Mac의 실행 테스트는 별도로 확인해야 합니다.
