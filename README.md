# 비주얼팀 NAS 링크 공유 — v4

Finder에서 NAS 폴더 우클릭 → 서비스 → NAS 링크 복사 → Flow에 HTTPS 링크 전송 → 받은 사람이 **VisualTeamNASOpen** 단축어로 Finder 폴더 열기.

두 가지 연결 경로를 지원합니다.
- `/Volumes/SND/Masmarulez/...`
- `/Volumes/Masmarulez/...`

보내는 쪽은 연결 경로를 공통 형식 `/Volumes/SND/Masmarulez/...`으로 변환합니다. 받는 쪽은 자신의 맥에서 실제 존재하는 위치를 찾습니다.

## 설치

팀원 배포 패키지 `VisualTeam_NAS_최종배포_v4.zip`에 포함된 **NAS 링크 복사.workflow**를 설치합니다. 기존 v3 워크플로우는 교체하세요.

단축어 이름은 정확히 `VisualTeamNASOpen`으로 사용합니다. 단축어 → 설정 → 고급 → **스크립트 실행 허용**을 확인합니다.

중요: 배포 ZIP의 `VisualTeamNASOpen.shortcut` 파일은 서명된 기존 v3 원본 그대로입니다. .shortcut 파일은 외부에서 코드만 고쳐 서명을 유지할 수 없기 때문에, `/Volumes/Masmarulez/` 사용자와 전체 v4 통일을 원하는 팀원은 단축어의 **셸 스크립트 실행** 코드를 `VisualTeamNASOpen_v4_한줄코드.txt` 내용으로 교체해야 합니다. 셸은 bash, 입력은 단축어 입력, 입력 전달은 stdin입니다. 실제 성공한 맥에서 수정본을 내보내면 이 수동 단계를 없앨 수 있습니다.

웹페이지: https://vansony.github.io/visualteam-nas-link/

## 보안

HTTPS 링크의 폴더 경로는 Base64URL로 인코딩될 뿐 암호화되지 않습니다. 파일 자체는 업로드하지 않지만, 폴더 구조를 외부에 드러낼 수 있으니 사내 정책에 맞게 공유하세요.
