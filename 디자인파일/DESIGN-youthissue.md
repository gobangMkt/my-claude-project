# Design System — 청년이슈 픽 (youthissue)

청년 정책·이슈를 랭킹으로 큐레이션하는 모바일 웹앱.
매주 자동 갱신되는 TOP 15 랭킹, 카테고리 필터, 페르소나별 영향도 분석 제공.
**고방(Gobang) 디자인 시스템을 기반**으로 youthissue 전용 규칙을 추가 정의한다.

---

## 1. 기반 디자인 시스템

`DESIGN-gobang.md` 의 모든 규칙을 상속한다. 아래는 youthissue에서 **추가·변경된 규칙**만 기술한다.

**상속 항목:** 색상 토큰, 타이포그래피, 섹션 카드 구조(8px 갭), 버튼/입력/모달 스타일, 바텀시트 애니메이션, Do & Don'ts.

---

## 2. 색상 — youthissue 추가 정의

### 카테고리 뱃지 컬러

고방 기본 시스템은 카테고리 뱃지를 단일 회색으로 통일하지만, youthissue는 이슈 카테고리의 시각적 구분을 위해 **카테고리별 개별 색상**을 사용한다.

| 카테고리 | 배경 | 텍스트 | 비고 |
|--------|------|--------|------|
| 주거 | `#EBF5FF` | `#2563EB` | 블루 계열 |
| 금융 | `#ECFDF5` | `#059669` | 그린 계열 |
| 취업 | `#FFF7ED` | `#D97706` | 앰버/주황 계열 |
| 복지 | `#F5F3FF` | `#7C3AED` | 퍼플 계열 |
| 교육 | `#E0F8FA` | `#00909D` | 테일 계열 (브랜드 컬러 활용) |

> **원칙:** 채도는 낮은 tint 배경 + 짙은 텍스트 조합. 강한 원색 배경 금지.

### 영향도(Impact) 컬러

페르소나별 정책 유불리를 5단계 색상으로 표현한다.

| 등급 | 레이블 | 뱃지 스타일 | 아이콘 |
|------|--------|------------|--------|
| very_positive | 매우 긍정 | `bg-[#00C73C] text-white` | 🔥 |
| positive | 긍정 | `bg-[#E8FBF0] text-[#00A030]` | ✅ |
| neutral | 해당없음 | `bg-[#F2F4F6] text-[#8B95A1]` | ➖ |
| negative | 부정 | `bg-[#FFF0F2] text-[#D92B2B]` | ⚠️ |
| very_negative | 매우 부정 | `bg-[#F04452] text-white` | 🚨 |

### Featured 카드 배경 (카테고리 tint)

TOP 3 featured 카드는 카테고리 색조를 배경에 미세하게 반영한다.

| 카테고리 | 기본 배경 | 호버 배경 |
|--------|----------|----------|
| 주거 | `#F0F7FF` | `#E3F0FF` |
| 금융 | `#F0FDF6` | `#E3FAF0` |
| 취업 | `#FFFBF0` | `#FFF5DC` |
| 복지 | `#FAF5FF` | `#F3EAFF` |
| 교육 | `#F5FCFD` | `#EAF9FB` |

### 순위 변동 컬러

| 방향 | 텍스트 | 예시 |
|------|--------|------|
| 상승 ▲ | `#D92B2B` (레드) | ▲3 |
| 하락 ▼ | `#00B2C0` (테일) | ▼1 |
| 유지 ― | `#B0B8C1` (뮤트) | ― |

---

## 3. 컴포넌트 — IssueCard

### Featured 카드 (1~3위)

```
레이아웃: flex row, gap 12px, padding 16px 12px
배경: 카테고리별 tint BG (위 표 참조), border-radius 10px
호버: 카테고리별 tint 호버 BG

순위 숫자: 22px / font-black / #191F28 (블랙)
카테고리 뱃지: 11px / font-bold / 카테고리별 색상
순위 변동: 11px / font-semibold / 방향별 색상
제목: 15px / font-bold / #191F28 / line-clamp 2
언론사 수: 11px / #1A7A85
```

### 일반 카드 (4위~)

```
레이아웃: flex row, gap 12px, padding 12px 4px
구분선: divide-y #F2F4F6 (섹션 내 리스트 분리)
호버: bg #F2F4F6, border-radius 10px

순위 숫자: 18px / font-bold / #8B95A1 (회색, 강조 없음)
카테고리 뱃지: 11px / font-bold / 카테고리별 색상
제목: 14px / font-semibold / #191F28 / line-clamp 2
언론사 수: 11px / #8B95A1
```

### 더보기 버튼

```
width: 100%
margin-top: 12px
padding: 12px
background: #F2F4F6
border-radius: 10px
font-size: 13px / font-semibold / #4E5968
hover: bg #E5E8EB

레이블:
  - 접힌 상태: "더보기 (N개)"
  - 펼친 상태: "접기"
```

---

## 4. 컴포넌트 — 정렬 탭

기사 수 순 / 혜택 많은 순을 전환하는 pill-style 탭.

```
컨테이너: bg #F2F4F6, border-radius 10px, padding 4px, display flex
탭 버튼: flex-1, padding 8px, border-radius 8px, 12px / font-bold

활성: bg white / text #00B2C0 / shadow-sm
비활성: text #8B95A1 / hover: text #4E5968
```

> "혜택 많은 순" 탭 활성 시 `?` 버튼 표시 → 클릭하면 영향도 등급 설명 박스 토글.

---

## 5. 컴포넌트 — 영향도 등급 설명 박스

```
배경: #E0F8FA / 테두리: 1.5px #A8E6EC / border-radius 10px / padding 16px

제목: 13px / font-bold / #1A7A85
설명: 12px / #1A7A85 / line-height 1.6
등급 행: label(14px 폭) + score(mono, #00B2C0) + desc(#4A5568)
```

---

## 6. 컴포넌트 — InsightBanner

주간 트렌드 요약 배너. 배경은 teal tint.

```
배경: #E0F8FA / 테두리: 1.5px #A8E6EC / border-radius 10px / padding 16px

헤더: 🔍 아이콘 + "이번 주 정책 트렌드" 13px/font-bold/#1A7A85
키워드 칩: 확대·상향·완화 등 — bg white / text #1A7A85 / border #A8E6EC / border-radius 9999px
페르소나 줄: 5개 페르소나 아이콘 + 유리한 이슈 수 표시
```

---

## 7. 컴포넌트 — 체크할 포인트 (이슈 상세)

기사에서 추출한 실제 수치·조건을 테이블 형태로 표시한다.

```
컨테이너: border 1.5px #E5E8EB / border-radius 10px / overflow hidden

행: flex justify-between, padding 12px 16px
행 구분선: border-bottom #F2F4F6 (마지막 행 제외)

레이블: 13px / #8B95A1 / font-medium
값: 13px / #191F28 / font-bold / text-right / max-width 55%

필터 규칙: "명시되지 않음·제공되지 않음·판단할 수 없음·알 수 없음" 포함 행 렌더링 제외
```

---

## 8. 컴포넌트 — 페르소나 영향도 카드 (이슈 상세)

```
카드: bg #F2F4F6 / border-radius 10px / padding 12px / flex row gap 12px

아이콘: 18px 이모지, shrink-0
페르소나명: 13px / font-bold / #191F28
영향도 뱃지: 위 Impact 컬러 표 참조
이유 텍스트: 12px / #4A5568 / line-height 1.6
```

---

## 9. 컴포넌트 — 출처 바텀시트

```
오버레이: rgba(0,0,0,0.4)
시트: bg white / border-radius 20px 20px 0 0 / padding 28px 24px 32px
애니메이션: slideUp 0.2s ease (globals.css .animate-slide-up)

출처 행: 언론사명 14px/font-semibold + 날짜 12px/#8B95A1 + 외부링크 아이콘
구분선: #F2F4F6
```

---

## 10. 페이지 구조

### 메인 페이지 (/)

```
Section 1 — Hero
  "오늘의 청년이슈 TOP N" / 갱신 주기 안내

Section 2 — 주간 인사이트 배너 (InsightBanner)

Section 3 — 카테고리 필터
  가로 스크롤 / 전체·주거·금융·취업·복지·교육
  활성: bg #00B2C0 text white / 비활성: bg #F2F4F6

Section 4 — 랭킹 리스트
  정렬 탭 (기사 수 순 / 혜택 많은 순)
  TOP 3 featured 카드 (카테고리 tint 배경)
  4~5위 일반 카드 (항상 노출)
  더보기 버튼 → 6위~ 나머지 펼치기
```

> 카테고리 또는 정렬 탭 변경 시 더보기 상태 자동 초기화.

### 이슈 상세 페이지 (/issue/[id])

```
뒤로가기 바 (sticky, top: 56px)

Section 1 — 헤더 (카테고리 뱃지 + 제목 + 태그)
Section 2 — 3줄 요약 (teal tint 카드) + 출처 버튼
Section 3 — 체크할 포인트 (수치·조건 테이블)
Section 4 — 나에게도 좋을까요? (페르소나 영향도)
Section 5 — 연관된 혜택도 확인하세요
```

---

## 11. 상태 관리 규칙

| 상태 | 초기값 | 초기화 트리거 |
|------|--------|-------------|
| activeCategory | '전체' | — |
| sortMode | 'press' | — |
| showMore | false | 카테고리/정렬 탭 변경 시 |
| showGradeInfo | false | — |
| showCriteria | false | — |

---

## 12. Quick Reference

```
/* 카테고리 뱃지 */
주거:  bg #EBF5FF / text #2563EB
금융:  bg #ECFDF5 / text #059669
취업:  bg #FFF7ED / text #D97706
복지:  bg #F5F3FF / text #7C3AED
교육:  bg #E0F8FA / text #00909D

/* Featured 카드 배경 */
주거:  #F0F7FF  /  금융:  #F0FDF6
취업:  #FFFBF0  /  복지:  #FAF5FF
교육:  #F5FCFD

/* 순위 숫자 */
TOP 3 (featured): #191F28 (블랙, 22px/font-black)
4위~  (일반):     #8B95A1 (회색, 18px/font-bold)

/* 영향도 뱃지 */
매우긍정: bg #00C73C  / text white
긍정:     bg #E8FBF0  / text #00A030
해당없음: bg #F2F4F6  / text #8B95A1
부정:     bg #FFF0F2  / text #D92B2B
매우부정: bg #F04452  / text white

/* 랭킹 변동 */
상승 ▲: #D92B2B  /  하락 ▼: #00B2C0  /  유지 ―: #B0B8C1

/* 더보기 버튼 */
bg #F2F4F6 / text #4E5968 / radius 10px / 13px/semibold

/* 정렬 탭 */
컨테이너: bg #F2F4F6 / radius 10px
활성:     bg white / text #00B2C0 / shadow-sm
비활성:   text #8B95A1
```
