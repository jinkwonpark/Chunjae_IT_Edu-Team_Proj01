# 📍Chunjae Project 01
천재교육 첫번째 프로젝트 
<br><br>
## 💻프로젝트 소개
"CORNEDU" 라는 인터넷 강의와 학부모 및 학생의 커뮤니티를 제공하는 가상 교육 기업이다.
<br><br>

### 📅 개발 기간
* 23.08.07 ~ 23.08.20
<br><br>

### 📌 주요기능
* **회원기능** (로그인, 로그아웃, 회원가입)
* **마이페이지** (개인정보수정 및 내가 쓴 글 목록, 글 상세보기)
* **관리자페이지** (관리자 정보 수정, 회원 목록 및 강제 탈퇴, 고객지원 관리, 커뮤니티 관리)
* **게시판** (게시판 글 목록, 글 상세보기, 글 등록, 글 수정, 글 삭제, 댓글)
* **Qna 및 FAQ** ( 글 목록, 글 상세보기, 글 등록, 글 수정, 글 삭제)
* **온라인 강의** (온라인 강의 목록, 강의 상세 보기, 동영상 플레이어)
<br><br>

### 👤 팀원 및 역할 분담
**박진권**
* 로고 제작
* 화면설계서 작성
* 공지사항 기능 구현
  * 글 작성, 수정, 삭제
* QnA 기능 구현
  * 글 작성, 수정, 삭제, 답변하기
* FAQ 기능 구현

**김현경** 
* 화면설계서 작성
* README.md 작성
* 서비스 소개 페이지 제작
* 마이페이지 기능 구현
  * 정보수정
  * 내가 쓴 글
* 게시판 조회수 기능 구현
* 프로젝트 최종 점검
* 시연영상 제작

**김보경**
* usecaseDiagram 작성
* WBS 작성
* 초/중/고 강의 및 교재 소개 화면 구현
* 회원 기능 구현
  * 로그인 및 로그아웃
  * 회원가입
  * 아이디 중복 체크
  * 비밀번호 유효성 검사
* 프로젝트 최종 점검
* 시연영상 제작

**신예은**
* usecaseDiagram 작성
* 관리자 페이지 기능 구현
  * 관리자 정보 변경
  * 회원관리
  * 고객지원 관리
  * 커뮤니티 관리
* 페이징 처리 기능 구현
* 커뮤니티 댓글 기능 구현
* 온라인 강의 기능 구현
  * 강의 목록
  * 강의 상세 정보
  * 동영상 플레이어
 * 프로젝트 최종 점검
 * 시연영상 제작

**오태훈**
* 요구사항정의서 작성
* 커뮤니티 기능 구현
  * 학부모 커뮤니티
  * 학생 커뮤니티
  * QnA 기능 구현
  * 공지사항 기능 구현
* 회사 소개 페이지 제작
* 오시는 길(다음API연동)

**전체 메뉴 구성 기획 및 DB 설계, frontend 설계는 다같이!**
<br><br>



### ⚙ 개발 환경
* 페이퍼 프로토타입으로 사용성을 테스트 한 후, html과 css, javascript로 작성하여 프론트엔드를 설계하였고
백엔드 부분은 jsp의 디렉티브, 스크립트릿, 표현식만 활용하여 기업형 데스크탑 웹 애플리케이션을 작성하였습니다. 

#### ✅FRONTEND : <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"><img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">

#### ✅BACKEND : <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">


#### ✅DATABASE : <img src="https://img.shields.io/badge/mariaDB-003545?style=for-the-badge&logo=mariaDB&logoColor=white"><img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">

#### ✅Server : <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

<br><br>


# ⚒프로젝트 설계

### 📂개념적 설계 (USECASE DIAGRAM)
<p align="center"><img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/dcf0a4ca-e88f-4bef-83de-e01ec3ceb509" alt="usecase diagram1"></p>
<p align="center"><img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/81f7a8c9-0b19-4d02-9431-f656227a07ac" alt="usecase diagram1"></p>
<p align="center"><img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/1276645f-7f53-41d1-b342-0f58e036448c" alt="usecase diagram1"></p>
<p align="center"><img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/8d695069-6102-40b5-b295-cf636ff73060" alt="usecase diagram1"></p>

<br><br>

### 📂논리적 설계
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/b9200ed8-74b4-427e-bafb-260a74497fe7)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/0615172e-5de9-433e-b295-dec689edf2b9)
<br><br>

### 📂논리적 ERD
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/fee9b456-59db-43e1-bec4-cb07f8ad6cf2)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/88a2c296-156e-4c71-b67d-3f756e66890c)
<br><br>

### 📂DATABASE - 테이블 ERD
<p align="center"><img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/8f58a9ad-9a32-4a86-9aa7-f80f48a8ab91" alt="usecase diagram1"></p>
<br><br>

### 📂DATABASE - 테이블 구현
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/e94a6a06-9672-4e26-ae7a-361aa2225e6a)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/1e40c798-815a-44b8-97e3-5214524e6366)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/fb25266e-ed08-45eb-978f-515c8cabdbb8)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/4d1ecd48-ff5e-4443-9dd0-a23fe91d8487)
![initial](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/cc1c70c4-1454-4b1a-8efe-29af5d83e5ba)
<br><br>

### 📂CLASS DIAGRAM
![classdiagram](https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/33b93fe1-b4df-4c75-ba1e-f4a6ba262df3)
<br><br>

# 📎기능 구현
## 🗂 회원 기능
### 1. 로그인
#### (1) 일반 로그인
- mariaDB를 연동하여 사용자가 입력한 아이디, 비밀번호와 같은 데이터가 존재하면 로그인 성공 처리
- 그렇지 않으면 로그인 실패 처리
- 비밀번호 입력값 확인 가능하도록 구현
### 2. 회원가입
#### (1) 일반 회원가입
- 회원 약관에 동의한 경우에만 회원 가입 가능하도록 구현
- 아이디 중복 체크 기능 구현
- 비밀번호 중복 검사, 영문자+숫자+특수문자 조합 8~20자리 유효성 검사 기능 구현
- 비밀번호 입력값 확인 가능하도록 구현
- 아이디, 비밀번호, 이름, 전화번호, 이메일을 입력받아 연동한 mariaDB에 INSERT 처리
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/139138265/63a4a308-9f0d-429c-bb17-9373f9f0bb23" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 로그인 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/139138265/604e7a1a-9931-4027-add9-adc6695492fa" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 회원가입 </sub></b>
    </td>
  </tr>
</table>
<br>

## 🗂 마이 페이지
### 1. 정보 수정
#### (1) 회원 정보 수정
- 현재 로그인한 회원의 정보를 연동된 mariaDB에서 SELECT하여 화면에 출력
- 이메일, 전화번호 데이터를 수정 가능하도록 구현
- 단, 비밀번호는 보안을 위하여 변경할 수 없으므로 관리자에게 문의

### 2. 내가 쓴 글
#### (1) 내가 쓴 글 게시판
- 현재 로그인한 회원이 작성한 글(qna 및 커뮤니티)과 연동된 mariaDB에서 SELECT하여 화면에 출력(id 와 author JOIN)
- 학부모일 경우 학부모 커뮤니티, 학생일 경우 학생 커뮤니티에서 내가 쓴 글 게시판으로 링크 설정
- 글을 클릭하면 내가 쓴 qna, board 게시판 글로 페이지가 이동
- 게시판에 조회수를 추가하였으며, 글제목을 클릭할 시 글 상세보기로 이동하면 조회수가 1씩 증가하도록 구현현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="1300" alt="2" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/76bc1238-7c6f-41ed-826b-3270a8b5842d"><br/>
      <sub><b> PIC1 : 마이페이지 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
       <img width="1300" alt="ssss" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/2b42fdd1-9560-4c36-8bf4-b6b13f790882"><br/>
      <sub><b> PIC2 : 회원 정보 수정 </sub></b>
    </td>
  </tr>
    <tr>
    <td align="center">
     <img width="960" alt="mypage1" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/f7cb9084-141c-4ba4-80ef-67c193666516">
 <br/>
      <sub><b> PIC3 : 내가 쓴 글 </sub></b>
    </td>
  </tr>
</table>
<br>

## 🗂 관리자 페이지
### 1. 정보 수정
#### (1) 관리자 정보 수정
- 관리자 로그인 시, 관리자의 정보를 연동된 mariaDB에서 SELECT하여 화면에 출력
- 이메일, 전화번호 데이터를 수정 가능하도록 구현
- 단, 비밀번호는 보안을 위하여 변경할 수 없음
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/48419e5e-d648-494b-a253-8528016c3fa6" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 관리자 페이지 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/c36b9517-b886-4cc6-8e03-d1a3b7026369" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 관리자 정보 수정 </sub></b>
    </td>
  </tr>
</table>
<br>


### 2. 회원 관리
#### (1) 회원 목록
- CORN EDU에 회원가입한 회원의 아이디, 이름, 가입일 데이터를 목록으로 화면에 출력
- 한 페이지에 10명의 데이터만 출력되도록 페이징 처리
- 관리자 로그인 시에만 페이지에 접근 가능하도록 구현
#### (2) 회원 강퇴
- 회원 목록 페이지에서 강퇴 버튼 클릭 시 회원 강제 탈퇴 처리
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/f0129245-0249-4935-8b41-a9469e70aa99" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 회원 목록 </sub></b>
    </td>
  </tr>
</table>
<br>

### 3. 고객지원 관리
#### (1) 답변이 필요한 질문 목록
- QnA 게시판에서 답변이 등록되지 않은 질문 목록 출력
- 답변하기 버튼 클릭 시 답변 등록 페이지로 이동
- 관리자 로그인 시에만 페이지에 접근 가능하도록 구현
#### (2) 답변 등록
- 답변할 질문 내용을 화면의 상단에 출력
- 화면의 하단에는 답변 입력창 출력
- 작성 버튼 클릭 시 입력된 답변 내용을 mariaDB에 INSERT 처리
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/2a96e814-54f0-41b4-a2e2-c0f0c93a639d" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 답변이 필요한 질문 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/0a49719c-0102-4ce8-aae1-5c2a4350e001" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 답변 등록 </sub></b>
    </td>
  </tr>
</table>
<br>

### 4. 커뮤니티 관리
#### (1) 학부모 커뮤니티 관리
- 학부모 커뮤니티 목록을 mariaDB에서 SELECT하여 화면에 출력
- 커뮤니티 규정에 어긋나는 게시물은 관리자 권한으로 수정하거나 삭제할 수 있도록 구현
- 관리자 로그인 시에만 페이지에 접근 가능하도록 구현
#### (2) 학생 커뮤니티 관리
- 학생 커뮤니티 목록을 mariaDB에서 SELECT하여 화면에 출력
- 커뮤니티 규정에 어긋나는 게시물은 관리자 권한으로 수정하거나 삭제할 수 있도록 구현
- 관리자 로그인 시에만 페이지에 접근 가능하도록 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/104690434/15942c06-3816-437a-9110-3992dd4fb6c4" width="1300" alt=""/> <br/>
      <sub><b> PIC1 : 학부모 커뮤니티 관리 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/49ea3359-3ac0-429d-96b5-72905e56c195" width="1300" alt=""/> <br/>
      <sub><b> PIC2 : 학생 커뮤니티 관리 </sub></b>
    </td>
  </tr>
</table>
<br>


## 🗂커뮤니티
### 1. 학생 및 학부모 커뮤니티
#### (1) 학부모 및 학생 커뮤니티 게시판
- 학부모,학생 커뮤니티 목록을 mariaDB에서 SELECT하여 화면에 출력
- 글번호, 글제목, 작성자, 작성일이 화면에 출력되며, 글번호 역순 정렬
- 글 제목 클릭할 시 상세보기로 이동하며 조회수 1 증가하도록 구현
#### (2) 글 관리(글 작성, 글 수정, 글 삭제)
- 회원이 본인의 아이디로 로그인시 본인이 작성한 글을 수정 및 삭제 가능하도록 구현
- 비회원은 글을 볼 수 없도록 구현
#### (3) 댓글
- 해당 게시글에 댓글을 생성할 수 있는 기능
- 댓글 작성자는 자신이 추가한 댓글을 삭제할 수 있도록 구현
- 관리자는 모든 댓글 삭제 가능
#### 📷 View
<table>
  <tr>
    <td align="center">
      <img width="960" alt="stucomu1" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/68a64e68-a3d9-4cfe-9de8-a4da51a65c12"><br/>
      <sub><b> PIC1 : 커뮤니티 게시판 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="960" alt="stucomupage" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/79cd8f4a-e4a8-422d-bb28-e36b6201d9b5"><br/>
      <sub><b> PIC2 : 게시판 상세 글 보기 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="960" alt="stucomuwrite" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/271195ef-6ffc-4ee3-b2b9-313d2e520237">
<br/>
      <sub><b> PIC2 : 게시판 글 작성 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="960" alt="stucomumodify" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/6fc61200-9a05-477e-92ee-ff018cb5aba1"><br/>
      <sub><b> PIC3 : 게시판 글 수정 </sub></b>
    </td>
  </tr>
</table>
<br>

## 🗂고객지원
### 1. 공지사항 및 QnA
#### (1) 공지사항
- 공지사항 글을 mariaDB에서 SELECT하여 화면에 출력
- 공지사항 글을 회원 및 관리자만 볼 수 있도록 구현
- 글 작성, 삭제는 관리자만 작성할 수 있도록 구현
#### (2) QnA
- qna 글을  mariaDB에서 SELECT하여 화면에 출력 
- qna 테이블의 author 과 member 테이블의 name을 JOIN하여 테이블 구현
- qna 글을 회원 및 관리자만 볼 수 있도록 구현
- qna 글 작성, 삭제는 회원 및 관리자만 볼 수 있도록 구현
#### 📷 View
<table>
  <tr>
    <td align="center">
     <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/4e3fb913-4b5c-4820-aea6-af403a87e6e0">
<br/>
      <sub><b> PIC1 : 공지사항 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/132269367/03b77f05-6d4a-41b4-9bc9-a38620a6a8a4">
<br/>
      <sub><b> PIC2 : qna </sub></b>
    </td>
  </tr>
</table>
<br>
        
###  2. FAQ
#### (1) FAQ 게시판
- 회원, 비회원 구분없이 볼 수 있도록 구현
- 토글 기능을 사용하여 화면에 출력 
#### 📷 View
<table>
  <tr>
    <td align="center">
     <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/132269367/2a360242-1bdc-49c7-b443-5e51c172037d">  
<br/>
      <sub><b> PIC1 : FAQ 게시판 </sub></b>
    </td>
  </tr>
</table>
<br>


## 🗂온라인 강의
### 1. 온라인 강의 목록
#### (1) 초등학생, 중학생, 고등학생 온라인 강의 목록
- mariaDB와 연동하여 초등학생, 중학생, 고등학생을 대상으로 한 온라인 강의 목록 출력
#### (2) 강의 상세 보기
- 화면 상단에는 사용자가 선택한 강의의 정보 출력
- 화면 하단에는 선택한 강의의 동영상 목록이 10개씩 페이지로 묶여 페이징 처리되어 출력
#### (3) 동영상 플레이어
- 재생, 일시정지, 정지, 사운드 조절 기능이 포함된 동영상 플레이어 구현
- 비로그인 시 접근 불가능
#### 📷 View
<table>
  <tr>
    <td align="center">
     <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/005d9c84-c62f-43bc-9b46-cef15506de02"><br/>
      <sub><b> PIC1 : 온라인 강의 목록 </sub></b>
    </td>
  </tr>
  <tr>
    <td align="center">
     <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/ceea4ccf-7308-4892-8ebe-ba22f73adb31"><br/>
      <sub><b> PIC2 : 강의 상세 보기 </sub></b>
    </td>
  </tr>  
  <tr>
    <td align="center">
     <img width="1300" alt="first" src="https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/70800414/e5af4c49-7b5d-458e-b9fd-6084a005a65e"><br/>
      <sub><b> PIC3 : 동영상 플레이어 </sub></b>
    </td>
  </tr>
</table>

## 🎬 콘에듀 시연영상

https://github.com/ChunjaeFullStackJavaMaker/Chunjae_Team_Proj01/assets/138674233/8e50f810-8ccd-4bce-b0f6-a553cc4de5d4
