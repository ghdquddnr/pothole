drop table vehicle_data;
-- 테이블 생성: vehicle_data
CREATE TABLE vehicle_data (
    data_id VARCHAR(50) NOT NULL,
    trmn_id VARCHAR(15), -- trmnCd 대신 trmnId 사용
    trsm_year CHAR(4),
    trsm_tm CHAR(6),
    trsm_ms CHAR(3), -- 4자리 대신 3자리로 조정
    vhcle_lot DECIMAL(13,10), -- detcLot 대신 vhcleLot
    vhcle_lat DECIMAL(12,10), -- detcLat 대신 vhcleLat
    fcws_cd VARCHAR(2), -- 문자열로 저장
    ldws_cd VARCHAR(2),
    pcws_cd VARCHAR(2),
    dows_cd VARCHAR(2),
    lbhl_stat_cd VARCHAR(2),
    hbhl_stat_cd VARCHAR(2),
    left_tusg_stat_cd VARCHAR(2),
    rght_tusg_stat_cd VARCHAR(2),
    hasg_stat_cd VARCHAR(2),
    alct_stat_cd VARCHAR(2),
    drlg_stat_cd VARCHAR(2),
    fglg_stat_cd VARCHAR(2),
    pklg_stat_cd VARCHAR(2),
    frnt_wiper_stat_cd VARCHAR(2),
    vhcle_acr DECIMAL(4,0),
    lane_cd VARCHAR(2),
    rgtr_id VARCHAR(30),
    reg_dt TIMESTAMP, -- ISO 8601 문자열 반영
    trsm_mt CHAR(2),
    trsm_dy CHAR(2),
    PRIMARY KEY (data_id)
);

-- 테이블 코멘트
COMMENT ON TABLE vehicle_data IS '차량 데이터 수집 테이블로, 차량의 위치, 상태, 경고 시스템 및 조명 상태 등을 기록';

-- 컬럼별 코멘트
COMMENT ON COLUMN vehicle_data.data_id IS '데이터ID: 고유 식별자 (예: PVDL-IDV1257443930-1636331275-17405)';
COMMENT ON COLUMN vehicle_data.trmn_id IS '단말기ID: 차량 단말기 식별자 (예: IDV1257027110)';
COMMENT ON COLUMN vehicle_data.trsm_year IS '패킷전송년도: 데이터 전송 연도 (예: 2021)';
COMMENT ON COLUMN vehicle_data.trsm_tm IS '패킷전송시간: 데이터 전송 시간, HHMMSS 형식 (예: 141804)';
COMMENT ON COLUMN vehicle_data.trsm_ms IS '패킷전송밀리초: 데이터 전송 밀리초, 3자리 (예: 090)';
COMMENT ON COLUMN vehicle_data.vhcle_lot IS '차량경도: 차량의 경도 좌표 (예: 127.107878)';
COMMENT ON COLUMN vehicle_data.vhcle_lat IS '차량위도: 차량의 위도 좌표 (예: 37.600536)';
COMMENT ON COLUMN vehicle_data.fcws_cd IS 'FCWS코드: 전방충돌경고 (0: 검지없음, 1: 버스, 2: 승용차, 3: 트럭, 4: 기타, 5: 특수차, 6: 자전거/오토바이)';
COMMENT ON COLUMN vehicle_data.ldws_cd IS 'LDWS코드: 차선이탈경고 (-1: 신호없음, 0: 검지없음, 1: 좌측이탈, 2: 우측이탈)';
COMMENT ON COLUMN vehicle_data.pcws_cd IS 'PCWS코드: 보행자충돌경고 (-1: 신호없음, 0: 정보없음, 1: 보행자감지)';
COMMENT ON COLUMN vehicle_data.dows_cd IS 'DOWS코드: 도로위험경고 (-1: 신호없음, 0: 정보없음, 1: 포트홀, 2: 좌측러버콘, 3: 우측러버콘)';
COMMENT ON COLUMN vehicle_data.lbhl_stat_cd IS '하향등상태코드: 하향등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.hbhl_stat_cd IS '상향등상태코드: 상향등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.left_tusg_stat_cd IS '왼쪽지시등상태코드: 좌측 방향지시등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.rght_tusg_stat_cd IS '오른쪽지시등상태코드: 우측 방향지시등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.hasg_stat_cd IS '경고등상태코드: 경고등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.alct_stat_cd IS '자동조명상태코드: 자동조명 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.drlg_stat_cd IS '주간주행등상태코드: 주간주행등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.fglg_stat_cd IS '안개등상태코드: 안개등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.pklg_stat_cd IS '주차등상태코드: 주차등 상태 (-1: 신호없음, 0: 소등, 1: 점등)';
COMMENT ON COLUMN vehicle_data.frnt_wiper_stat_cd IS '전면와이퍼상태코드: 전면 와이퍼 상태 (0: unavailable, 1: off, 2: intermittent, 3: low, 4: high, 5: washerInUse, 6: automaticPresent)';
COMMENT ON COLUMN vehicle_data.vhcle_acr IS '차량가속도: 차량의 가속도 값 (예: 0)';
COMMENT ON COLUMN vehicle_data.lane_cd IS '차로코드: 차로 유형 (-1: 신호없음, 0: 검지 못함, 10: 버스전용차로, 11: 중앙버스차로, ..., 21: 일반1차로, ..., 99: 기타)';
COMMENT ON COLUMN vehicle_data.rgtr_id IS '등록자ID: 데이터 등록자 식별자 (예: V2X)';
COMMENT ON COLUMN vehicle_data.reg_dt IS '등록일시: 데이터 등록 시각, ISO 8601 형식 (예: 2025-04-11T12:38:53.000+00:00)';
COMMENT ON COLUMN vehicle_data.trsm_mt IS '패킷전송월: 데이터 전송 월, MM 형식 (예: 11)';
COMMENT ON COLUMN vehicle_data.trsm_dy IS '패킷전송일: 데이터 전송 일, DD 형식 (예: 08)';

CREATE INDEX idx_vehicle_data_trmn_cd ON vehicle_data (trmn_id);
CREATE INDEX idx_vehicle_data_reg_dt ON vehicle_data (reg_dt);