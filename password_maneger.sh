#!/bin/bash

# パスワードを保存するファイル
password_file="passwords.txt"

# メインメニューの表示
function main_menu {
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
}

# パスワードを追加
function add_password {
  echo "サービス名を入力してください:"
  read service_name
  echo "ユーザー名を入力してください:"
  read username
  echo "パスワードを入力してください:"
  read password
  echo "$service_name:$username:$password" >> "$password_file"
  echo "パスワードの追加は成功しました。"
}

# パスワードを取得
function get_password {
  echo "サービス名を入力してください:"
  read service_name
  if grep -q "^$service_name:" "$password_file"; then
    result=$(grep "^$service_name:" "$password_file")
    IFS=":" read -a arr <<< "$result"
    echo "サービス名: ${arr[0]}"
    echo "ユーザー名: ${arr[1]}"
    echo "パスワード: ${arr[2]}"
  else
    echo "そのサービスは登録されていません。"
  fi
}

#　ループ
while true; do
  main_menu
  read choice

  case $choice in
    "Add Password")
      add_password
      ;;
    "Get Password")
      get_password
      ;;
    "Exit")
      echo "Thank you!"
      break
      ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
  esac
done

