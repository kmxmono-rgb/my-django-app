# 1. 直接透過指令建立 build.sh 並寫入內容
cat << 'EOF' > build.sh
#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt
python manage.py collectstatic --no-input
python manage.py migrate
EOF

# 2. 賦予執行權限並推送到 GitHub
chmod a+x build.sh
git add build.sh
git commit -m "Add build.sh"
git push
