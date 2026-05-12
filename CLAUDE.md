# my-claude-project 개발 환경 가이드

모든 프로젝트가 따라야 할 통합 규칙 및 환경 설정입니다.

## 전체 규칙

### 언어
모든 응답은 **한국어**로 합니다.

### 작업 폴더 규칙
- 모든 프로젝트는 `my-claude-project/프로젝트/` 폴더 안에 위치
- 각 프로젝트는 독립적인 git repository 유지
- 작업 폴더 변경 시 사용자에게 확인 후 진행

### Git 워크플로우
- **처음 작업**: `git clone https://github.com/gobangMkt/my-claude-project`
- **매번 작업 시작**: `git pull` (최신 상태 받기)
- **작업 완료 후**: `git add` → `git commit` → `git push`
- 각 프로젝트도 동일하게 진행

### 커밋 메시지 규칙
```
[타입]: 설명

선택적 본문

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
```

**타입:**
- `feat`: 새 기능
- `fix`: 버그 수정
- `docs`: 문서
- `refactor`: 코드 정리
- `style`: 스타일/UI
- `test`: 테스트

### 코딩 스타일
- **들여쓰기**: 2칸 (스페이스)
- **줄 길이**: 100자 이내 권장
- **세미콜론**: 필수
- **따옴표**: 싱글 또는 백틱 (템플릿 리터럴)
- **주석**: 최소화 (WHY가 명백하지 않을 때만)

## 프로젝트별 규칙

각 프로젝트는 자신의 `CLAUDE.md`에서 다음을 정의합니다:
- 빌드/테스트 방법
- 프로젝트별 코딩 컨벤션
- 배포 방법
- 기술 스택 구성

**예:** `프로젝트/RoutineLog-/CLAUDE.md`

## 공용 Skills

`프로젝트/.claude/skills/` 에 정의된 skills를 모든 프로젝트에서 사용 가능합니다.

(향후 추가 예정)

## 프로젝트 목록

| 프로젝트 | 언어 | 상태 |
|---------|------|------|
| RoutineLog- | React + TypeScript | ✅ 배포됨 |
| roomrecommand | TypeScript | 진행 중 |
| youth-housing-diagnosis | JavaScript | 진행 중 |
| blog_request | HTML | 진행 중 |
| youthissue | TypeScript | 진행 중 |

## 배포 가이드

각 프로젝트의 배포 방법은 프로젝트별 CLAUDE.md를 참조하세요.

**공통:**
- 배포 전 `git status` 확인
- main/production 브랜치에만 배포
- 배포 후 프로덕션 동작 확인

## GitHub 관리

- **root repo**: https://github.com/gobangMkt/my-claude-project
- **프로젝트별 repo**: https://github.com/gobangMkt/{project-name}

### 기본 브랜치
- root: `master`
- 각 프로젝트: `master`

## 행동 규칙
- 이미 읽은 파일은 내용이 변경되지 않았다면 다시 읽지 말 것
- 단순 질문에 ls/cat 등 도구 호출 금지, 지식 기반으로 답할 것
- 이미 설명한 내용은 반복하지 말 것

## 미리보기 창
- Claude Preview(`mcp__Claude_Preview__preview_*`)는 사용자가 명시적으로 "미리보기", "preview 띄워줘" 등 요청할 때만 호출. 그 외에는 절대 자동으로 `preview_start` 호출하지 말 것.
