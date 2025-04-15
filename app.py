from flask import Flask, render_template, jsonify
import psycopg2
from psycopg2.extras import RealDictCursor
import os

app = Flask(__name__)

# 데이터베이스 연결 설정
def get_db_connection():
    conn = psycopg2.connect(
        host='192.168.0.47',
        port=15432,
        database='postgres',
        user='pothole',
        password='pothole2314'
    )
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/vehicle_data')
def get_vehicle_data():
    try:
        conn = get_db_connection()
        cur = conn.cursor(cursor_factory=RealDictCursor)
        
        cur.execute('''
            SELECT 
                data_id, trmn_id, vhcle_lot, vhcle_lat,
                fcws_cd, ldws_cd, pcws_cd, dows_cd,
                lbhl_stat_cd, hbhl_stat_cd, left_tusg_stat_cd,
                rght_tusg_stat_cd, hasg_stat_cd, alct_stat_cd,
                drlg_stat_cd, fglg_stat_cd, pklg_stat_cd,
                frnt_wiper_stat_cd, vhcle_acr, lane_cd,
                reg_dt
            FROM vehicle_data
            ORDER BY reg_dt DESC
            LIMIT 1000
        ''')
        
        data = cur.fetchall()
        cur.close()
        conn.close()
        
        return jsonify(data)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True) 