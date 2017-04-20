#!/bin/sh

# 绿底白字
echo_green () {
    echo -e "\033[42;37m$1\033[0m";
}
# 红底白字
echo_red () {
    echo -e "\033[41;37m$1\033[0m";
}

DIR=`dirname $0`
cd $DIR

PID=`ps -ef | grep $DIR | grep -v grep | grep -v $0 | awk '{print $2}'`
if [ "$PID" = "" ]; then
    echo_red "未能查找到有效的pid号"
else
    kill $PID
    if [ $? -eq 0 ]; then
        echo_green "已成功发送kill命令pid: $PID"
    else
        echo_red "发送kill命令后得到失败结果pid: $PID"
    fi
fi
