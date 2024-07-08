# coding: utf-8
import cv2
import numpy as np
import time
import os
from PIL import Image
import subprocess
import json
import psutil
from flask import Flask, render_template, Response, request, url_for, jsonify
from flask_cors import CORS
from pretrained_model.grass_segmentaion.deeplab import DeepLabModel

app = Flask(__name__)
CORS(app)


model_path = "./pretrained_model/grass_segmentaion/grassSeg.tar.gz"
seg_model = DeepLabModel(model_path)


@app.route('/video', methods=['GET', 'POST'])
def videoshow():
    return render_template('index.html', videourl=url_for('video_feed'))


@app.route('/video_feed', methods=['GET', 'POST'])
def video_feed():
    return Response(gen(), mimetype='multipart/x-mixed-replace; boundary=frame')


@app.route('/stop', methods=['GET', 'POST'])
def stop_car():
    for process in psutil.process_iter():
        process.kill()
    return render_template('stop.html')


@app.route('/delete_file', methods=['GET', 'POST'])
def delete_file():

    filename = '/root/.ros/map.bag'
    command00 = 'source /root/.bashrc'
    command0 = 'cd /opt/open_mower_ros'
    command1 = 'source ./mower_config.sh'
    command2 = 'source ./devel/setup.bash'
    command3 = 'rosservice call /mower_map_service/clear_map'
    # try:
    # result = subprocess.run(command00)
    # result = subprocess.run(command0, shell=True)
    # result = subprocess.run(command1, shell=True)
    # result = subprocess.run(command2, shell=True)
    result = subprocess.run(command3, shell=True)
    # os.remove(filename)
    return render_template('deletesuccess.html')
    # except Exception as e:
    #     return render_template('deletefail.html')

@app.route('/date', methods=['GET', 'POST'])
def choose_date():
    return render_template('top.html')

@app.route('/law', methods=['GET', 'POST'])
def law():
    return render_template('law.html')

@app.route('/history', methods=['GET', 'POST'])
def history():
    return render_template('history.html')

@app.route('/road', methods=['GET', 'POST'])
def road():
    return render_template('chooseroad.html')

@app.route('/allchart', methods=['GET', 'POST'])
def chart():
    return render_template('chart.html')

@app.route('/taskchart', methods=['GET', 'POST'])
def taskchart():
    return render_template('taskchart.html')

@app.route('/data', methods=['GET'])
def get_data():
    with open('E:\Desktop/flask(2)/flask/flask/static/data/data1.json', 'r') as f:
        data = json.load(f)
    return jsonify(data)

@app.route('/taskdata', methods=['GET'])
def get_warning_data():
    with open('E:\Desktop/flask(2)/flask/flask/static/data/data2.json', 'r') as f:
        data = json.load(f)
    return jsonify(data)

@app.route('/warningdata', methods=['GET'])
def get_task_data():
    with open('E:\Desktop/flask(2)/flask/flask/static/data/data3.json', 'r') as f:
        data = json.load(f)
    return jsonify(data)

@app.route('/warn', methods=['GET'])
def warning():
    return render_template('warning.html')

def gen():
    cap = cv2.VideoCapture(0)
    cap.set(3, 600)
    cap.set(4, 480)
    cap.set(5, 30)

    while True:
        ret, img = cap.read()

        #####################
        image_resized, image_mask= seg_model.run(Image.fromarray(img)) 
        green_mask = np.zeros((256, 256, 3), dtype=np.uint8)
        green_mask[image_mask[:,:,0] == 1] = [144, 238, 144][::-1]
        mixed = (0.8*np.asarray(image_resized) + 0.2*green_mask).astype(np.uint8)
        img = mixed
        img = cv2.resize(img, (600,480))
        #####################

        ret, jpeg = cv2.imencode('.jpg', img)  # 对图像进行编码输出 jpeg
        yield (b'--frame\r\n' + b'Content-Type: image/jpeg\r\n\r\n' + jpeg.tobytes() + b'\r\n\r\n')


if __name__ == '__main__':
    app.run(host='192.168.0.98', port=8081, debug=True)
