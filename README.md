# 차량 데이터 시각화 시스템

이 프로젝트는 차량의 위치와 상태 데이터를 지도에 시각화하여 보여주는 웹 애플리케이션입니다.

## 주요 기능

- 카카오맵을 이용한 차량 위치 표시
- 실시간 차량 데이터 조회
- 마커 클릭 시 상세 정보 표시
- PostgreSQL 데이터베이스 연동

## 기술 스택

- Backend: Python Flask
- Database: PostgreSQL
- Frontend: HTML, CSS, JavaScript
- Map API: Kakao Maps

## 설치 및 실행 방법

1. 필요한 패키지 설치:
```bash
pip install -r requirements.txt
```

2. 데이터베이스 설정:
- PostgreSQL 데이터베이스 생성
- vehicle_data.sql 파일 실행하여 테이블 생성

3. 서버 실행:
```bash
python app.py
```

4. 웹 브라우저에서 접속:
```
http://localhost:8080
```

## 프로젝트 구조

```
pothole/
├── app.py              # Flask 서버
├── requirements.txt    # Python 패키지 의존성
├── templates/          # HTML 템플릿
│   └── index.html      # 메인 페이지
└── README.md          # 프로젝트 설명
```

## 라이센스

MIT License 