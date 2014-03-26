#!/bin/bash
src_dir='src'
if [[ ! -d $src_dir ]]; then echo "错误：必须在src同目录执行脚本"; exit 1; fi

cmd="./objs/srs -c conf/demo.19350.conf"
echo "启动SRS转发服务器：$cmd"
pids=`ps aux|grep srs|grep "./objs"|grep "demo.19350.conf"|awk '{print $2}'`; for pid in $pids; do echo "结束现有进程：$pid"; kill -s SIGKILL $pid; done
./objs/srs -c conf/demo.19350.conf
ret=$?; if [[ 0 -ne $ret ]]; then echo "错误：启动SRS转发服务器失败"; exit $ret; fi

echo "启动SRS转发服务器成功"
exit 0
