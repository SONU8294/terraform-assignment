#!/bin/bash
# Update and install dependencies
yum update -y
yum install -y git python3 nodejs npm

# Create app directories
mkdir -p /home/ec2-user/flask-app
mkdir -p /home/ec2-user/express-app
cd /home/ec2-user

# Clone your repositories (replace with your actual GitHub URLs)
# Example:
# git clone https://github.com/yourusername/flask-app.git flask-app
# git clone https://github.com/yourusername/express-app.git express-app

# ---- Flask setup ----
cd /home/ec2-user/flask-app
pip3 install flask
cat > app.py << 'EOF'
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Flask on EC2!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

# Run Flask in background
nohup python3 app.py > flask.log 2>&1 &

# ---- Express setup ----
cd /home/ec2-user/express-app
npm init -y
npm install express

cat > index.js << 'EOF'
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Express on EC2!');
});

app.listen(3000, '0.0.0.0', () => {
  console.log('Express app running on port 3000');
});
EOF

# Run Express in background
nohup node index.js > express.log 2>&1 &
