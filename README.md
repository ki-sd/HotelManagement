# Hotel Management System (호텔 관리 시스템)

웹 기반 호텔 인적 자원 및 예약 관리 백엔드 시스템입니다.
MVC 패턴을 기반으로 설계되었으며, 데이터베이스 아키텍처 고도화와 BCrypt를 이용한 보안 강화를 목표로 개발 중인 프로젝트입니다.

## 🗓프로젝트 기간
* **2026.05.01 ~ 진행 중**

## 기술 스택 (Tech Stack)

### Backend
![Java](https://img.shields.io/badge/Java_25-ED8B00?style=flat-square&logo=java&logoColor=white)
![Servlet/JSP](https://img.shields.io/badge/Servlet%2FJSP-007396?style=flat-square&logo=java&logoColor=white)
![MyBatis](https://img.shields.io/badge/MyBatis_3.5.15-000000?style=flat-square)
![Oracle DB](https://img.shields.io/badge/Oracle_DB-F00000?style=flat-square&logo=oracle&logoColor=white)

### Frontend
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)

### Build & Tools
![Gradle](https://img.shields.io/badge/Gradle-02303A?style=flat-square&logo=gradle&logoColor=white)
![jBcrypt](https://img.shields.io/badge/jBcrypt-4A154B?style=flat-square&logo=springsecurity&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IntelliJ_IDEA-000000?style=flat-square&logo=intellij-idea&logoColor=white)
![DBeaver](https://img.shields.io/badge/DBeaver-382923?style=flat-square&logo=dbeaver&logoColor=white)

---

## 주요 기능 (Key Features)

* **보안 및 인증 (Security)**
    * `jBcrypt` 라이브러리를 활용한 사용자 비밀번호 안전 암호화 및 검증
* **직원 관리 (Employee Management)**
    * 호텔 직원(Emp) 목록 조회 및 페이징 처리 기능 구현
    * 직원 직급(Rank) 및 재직 상태(Status) 열거형(Enum) 기반 체계적 관리
* **데이터 모델링 (Data Modeling)**
    * 객체지향적인 VO(Value Object) 설계 (Customer, Room, Reservation 등)
    * 데이터베이스 테이블 구조와 1:1 매핑 및 다중 JOIN 결과를 처리하기 위한 객체 포함 관계(Composition) 적용

---

## Architecture Evolution & Refactoring

본 프로젝트는 서비스의 성능 향상과 코드 유지보수성 증대를 위해, 3단계에 걸쳐 데이터베이스 연동 아키텍처를 고도화했습니다.

### [Phase 1] 순수 JDBC 기반 수동 커넥션 관리 (Legacy)
* **구조:** `Class.forName()`으로 오라클 드라이버를 로드하고, 매 요청마다 `DriverManager.getConnection()`으로 DB 커넥션을 맺고 끊는 방식.
* **한계:** 트래픽이 증가할 경우 DB 커넥션을 매번 새로 생성하는 물리적인 오버헤드가 발생하여, 서버 응답 속도가 저하되는 병목 현상(Bottleneck) 확인.

### [Phase 2] DBCP (Database Connection Pool) 도입 (Performance)
* **개선:** 데이터베이스 커넥션을 서버 구동 시점에 미리 생성해 두고 대여/반납하는 **DBCP(커넥션 풀) 방식**으로 아키텍처 개편.
* **결과:** 매번 커넥션을 생성하고 파기하는 네트워크 및 메모리 리소스 낭비를 제거하여, 다중 사용자 접속 시의 트랜잭션 처리 속도와 서버 안정성 대폭 향상.

### [Phase 3] MyBatis 프레임워크 통합 (Maintainability)
* **개선:** `PreparedStatement` 기반의 길고 복잡했던 수동 SQL 바인딩 코드를 폐기하고, **MyBatis (v3.5.15)** ORM 프레임워크 전면 도입.
* **결과:**
    * **관심사 분리:** 자바 비즈니스 로직과 SQL 쿼리문(Mapper XML)을 완벽하게 분리하여 코드 가독성 및 유지보수성 극대화.
    * **풀링 통합:** `config.xml` 환경 설정에 `type="POOLED"` 속성을 적용하여, 기존에 구축했던 커넥션 풀 시스템을 MyBatis 내부로 깔끔하게 통합.
    * **생산성 증가:** DB 결과 셋(ResultSet)을 `EmpVO`, `CustomerVO` 등의 자바 객체로 자동 매핑하여 반복적인 보일러플레이트(Boilerplate) 코드 대거 삭제.

---

## 설치 및 실행 방법 (Setup & Installation)

보안을 위해 데이터베이스 접속 정보(`db.properties`)는 GitHub 저장소에 공유되지 않습니다. 프로젝트를 로컬에서 실행하려면 다음 환경 설정이 필수적으로 요구됩니다.

1. **저장소 클론**
```bash
git clone [https://github.com/ki-sd/HotelManagement.git](https://github.com/ki-sd/HotelManagement.git)
```
2. DB 접속 정보 설정

src/main/resources/ 경로에 있는 db_properties_sample 파일의 이름을 db.properties로 변경합니다.

본인의 환경에 맞게 오라클 DB 접속 정보를 기입합니다.

```Properties
    # db.properties
    
url=jdbc:oracle:thin:@localhost:1521:XE
driver=oracle.jdbc.OracleDriver
username=YOUR_USERNAME
password=YOUR_PASSWORD
```
3. 빌드 및 실행

IntelliJ IDEA에서 프로젝트 열기 및 Load Gradle Changes (의존성 다운로드)

Tomcat 등의 Web Container를 구성하여 웹 애플리케이션 실행

---

### 디렉토리 구조 (Directory Structure)
```Plaintext
src/main/
├── java/com/kisd/
│   ├── commons/      # DB Connection 유틸리티 (DBUtil)
│   ├── dao/          # 데이터베이스 접근 객체 (EmpDAO)
│   ├── mapper/       # MyBatis SQL 매퍼 XML (EmpMapper.xml)
│   └── vo/           # 데이터 전송 객체 및 Enum (EmpVO, CustomerVO 등)
├── resources/        # MyBatis 환경 설정 (config.xml) 및 DB 프로퍼티
└── webapp/jsp/       # 프론트엔드 뷰 페이지 (main.jsp)
```