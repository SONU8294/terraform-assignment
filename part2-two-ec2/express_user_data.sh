#!/bin/bash
yum update -y
yum install -y git curl
cd /tmp
curl -O https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.xz
sudo tar -C /usr/local --strip-components 1 -xJf node-v16.20.2-linux-x64.tar.xz

mkdir -p /home/ec2-user/express-app
cd /home/ec2-user/express-app

cat > index.js << 'EOF'
const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Express (Frontend) on EC2!');
});

app.listen(3000, '0.0.0.0', () => {
  console.log('Express app running on port 3000');
});
EOF

npm init -y
npm install express
nohup node index.js > express.log 2>&1 &
