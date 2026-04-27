#!/bin/bash
# 프로젝트 루트에 run.bat 자동 생성 스크립트
# Stop 훅에서 호출됨

CWD=$(pwd)

# package.json 없으면 종료 (상대경로로 체크)
if [ ! -f "./package.json" ]; then
  exit 0
fi

# dev 스크립트 없으면 종료 (상대경로로 node 실행)
DEV=$(node -e "try{var p=require('./package.json');process.stdout.write(p.scripts&&p.scripts.dev||'')}catch(e){}" 2>/dev/null)
if [ -z "$DEV" ]; then
  exit 0
fi

# 포트 감지 (--port 3001 또는 -p 3000 패턴)
PORT=$(echo "$DEV" | grep -oE '(--port|-p) [0-9]+' | grep -oE '[0-9]+' | head -1)
PORT=${PORT:-3000}

# run.bat 생성 (Windows CRLF) - 상대경로로 저장
printf "@echo off\r\ntitle 실행 중 - 청년이슈픽\r\ncd /d \"%%~dp0\"\r\necho 서버 시작 중... (http://localhost:%s)\r\nstart \"\" cmd /k \"npm run dev\"\r\ntimeout /t 3 /nobreak > nul\r\nstart http://localhost:%s\r\n" "$PORT" "$PORT" > "./run.bat"

echo "{\"systemMessage\": \"✅ run.bat 생성 완료 (http://localhost:$PORT)\"}"
