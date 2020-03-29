#! /bin/bash

echo "执行的文件名：$0";

if [ -n "$1" ]; then
  echo "第一个参数为：$1";
  # 打包
  if [ "$1" == "apk" ]; then
      flutter build apk
    else
      flutter build ios --release
  fi

else
  echo "没有包含第一参数";
fi



