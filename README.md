# [CO-WORK] 실시간 업무 공유 협업

담당 기능: Mypage 관리자기능(회사, 구성원) 일정 예약 회의실 예약 전자결재함 등

생성일: 2023년 4월 16일 오후 4:25

프로젝트 기간: 2023년 3월 17일 → 2023년 4월 27일

## 소개

웹개발에 있어 개발 사이클을 경험하였던 팀 프로젝트입니다.

DB, 구조, 설계, 모든 기획을 팀에서 진행하였습니다. 

### 인원별 담당 기능(총 5명)

* `Mypage` `관리자기능(회사, 구성원)` `일정 예약` `회의실 예약` `전자결재함`  | `팀원 코드 피드백`
* `담당 파트에 대한 DB 설계, 쿼리문 `

### 개발환경

* 도구 : STS4, IntelliJ, SQLDeveloper, GITHUB, Bracket

* DB   : ORACLE XE 11G

* 언어 : JAVA, Javascript, JQuery, HTML, CSS

* 기타 : Scouter Monitring, nGrinder, Notion

### Database E-R Diagram

## ❗ 개선 및 구현이 필요한 문제

* ### 일정 예약 부분에서 많은 양의 데이터 로딩시 한번에 렌더링되는 문제
  * DB에 존재하는 모든 데이터를 한번에 응답받습니다. 이로 인해 테스트 데이터를 10만건 삽입하였을 때
  
    예약 페이지의 로딩이 약 5~10초의 시간이 걸립니다. 

    **EhCache를 활용하여 데이터 조회는 4초대에서 0.5초대로 줄였지만 화면 로딩에서 문제가 생겼다.**

    현재 생각중인 해결방안은 아래와 같습니다.

* FullCalendar - events 항목을 전달할 때 쿼리의 WHERE절을 추가하여 보고있는 월의 데이터 전달

### 관리자 기능중 구성원 관리 - 인원 상태별 구분이 필요한 문제

현재 1개 페이지에서 모든 인원을 출력하고 있다. 상태는 `정상, 이용중지, 가입 대기중` 으로 나뉜다.

- 상단에 별도의 탭을 구성하여 `전체 | 정상 | 이용중지 | 가입 대기중` 으로 개선할 예정
- SELECT 박스를 추가하여 데이터의 정렬순서를 설정할 수 있게 개선 예

### 일정 체크박스를 통한 일정 랜더링 문제

개인/부서 일정의 체크박스를 통하여 체크된 일정만 표현을 하고 싶다. 

Ajax를 통하여 해결이 가능할거라 예상되어 개선할 예정이다.


## 프로젝트 진행하고서 느낀점

### 기록의 문서화의 소중함

 개발을 해본적이 없던 5명이 모여서 진행하다보니 모르는게 더 많았습니다. 그렇게 회의를 통하여 기능을 나누고 하는 과정에서 회의록을 작성하지 않다보니 이후에 각자 맡은 역할에서 혼선이 생기기도 하였습니다. 

 그리고 진행해야하는 파트를 관리없이 개발을 했습니다. 일정이나 진행도 파악을 하기가 어려웠고 진행하면서 생겼던 문제, 해결방법 등을 마치고나니 생각에만 의존해야 했습니다. 

 이러한 문제를 겪으면서 기록의 중요성을 깨닫고 기록으로 끝나는 것이 아니라 이후 필요한 내용을 찾아 볼수 있도록 정리 또한 알아 갔습니다. 

### 테스트코드의 부재… 아쉬움

Test Driven Development를 책을 통해서만 개념을 알았습니다. 

개발/수정하면 서버를 On/Off하면서 페이지에서 기능을 직접 손으로 만지면서 문제점을 찾아갔습니다. 이로 인해 상당한 시간이 소요되었습니다. 테스트코드의 작성시간도 추가로 생기겠지만 이후 유지보수의 편의성을 위하여 테스트코드를 숙지해야겠다 생각했습니다. 

### 노력과 자신감

남들에 비하면 많이, 엄청 늦은 나이에 시작하기엔 모든것이 겁이 났습니다. 하지만 앞으로도 재미있고 하고 싶었던 일을 하고 싶었기에 생각을 참 많이 했습니다. 

 지금은 기억이 잘 나진않지만 10년전 오토핫키를 처음 접하여 코드를 짤때부터 재미를 느꼈었던것 같습니다. 

 이후 업무에서는 구글-스프레드 시트에서 필요한 스크립트를 공부하여 업무에 접목시켰습니다. 접목한 내용은 팀에서 개인별 시트에 작성한 내용을 매일 17시에 자동 취합해주는 내용이었습니다. 

 이처럼 새로운걸 배울때마다 꾸준하게 노력했습니다. 교육기간동안 모든것이 처음 배우는 것이었습니다. 이 또한 꾸준히 노력하고 스스로 공부하여 극복하였고 문제들도 해결할 수 있다는 자신감을 얻을 수 있었습니다. 

---

## 담당 파트 소개

```java
일정
FullCalendar를 활용하여 일정 추가, 수정, 삭제 기능
종료일을 +1일 해야 칸에 맞게 일정이 등록되는 이슈로 로직 추가
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
			LocalDateTime date = LocalDateTime.parse(end_full_date, formatter);
			LocalDateTime date2 = date.plusDays(1);
			calendar.setCal_end_date(date2.toString().substring(0, 10) + " " + date2.toString().substring(11, 16));
```

```java
**회의실 예약**
예약 가능과 불가 회의실 구분
예약하기 버튼을 클릭하여 예약 페이지로 이동
본인의 이벤트는 녹색, 타인의 이벤트는 파란색 배경으로 출력
```

```java
**예약 내역**
본인이 예약한 내역 출력. 삭제 버튼을 추가하였으며, 이벤트는 10개씩 출력하고 페이징 처리를 함.
```

```java
**내 프로필**
연락처와 팩스번호만 수정이 가능.
외 다른 정보는 관리자가 수정
```

```java
회의실, 구성원 관리에서 기존 데이터 수정, 삭제가 가능하며 신규로 등록이 가능함.
```

```java
기안자, 결재대기자 클릭시 하단 팝업 스타일로 결재자 출력.
각 페이지별 검색기능을 적용하였으며, DB는 서브쿼리와 조인을 활용하여 필요한 정보들을 수집함
```
