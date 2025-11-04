#!/bin/bash
yum update -y
yum install -y python3 git
mkdir -p /home/ec2-user/flask-app
cd /home/ec2-user/flask-app

cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Flask (Backend) on EC2!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

pip3 install flask
nohup python3 app.py > flask.log 2>&1 &
