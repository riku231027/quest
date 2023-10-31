echo "パスワードマネージャーへようこそ！"

echo -n "サービス名を入力してください: "
read service

echo -n "ユーザー名を入力してください: "
read username

echo -n "パスワードを入力してください: "
read password

echo "$service:$username:$password" >> password.txt

echo -e "Thank you\e[31m!\e[m"

