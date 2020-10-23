#!/bin/sh

    echo ""
    echo "****************************************************************************************"
    echo ""
    echo "   警告 : 你正在更新生产环境服务模块!!!"
    echo "   [ 模块： dubbo, wx, core, batch, center ]"
    echo ""
    echo "****************************************************************************************"
    PROJECT_PATH='/home/invoo2e/version/1.0.1'
    SHORT_NAME=""

            #################模块选择#########################
    echo ""
    echo -e "请输入模块名: \c"
            while read answer
do
        if [ "$answer" == "dubbo" -o "$answer" == "core" -o "$answer" == "wx" -o "$answer" == "batch" -o "$answer" == "center" ]; then
            SHORT_NAME=$answer
        break
                else
    echo "${answer}模块未找到, 请输入 [wx, dubbo, core, batch, center] 中的一个"
    echo -e "请输入模块名: \c"
    fi
            done
    echo "待更新模块：service-invoo-server-$SHORT_NAME"
    echo ""
    echo "****************************************************************************************"
            ################maven 构建#########################
    echo ""
    echo -e "是否从git构建(Y): \c"
    read answer
if [ "$answer" == "Y" -o "X$answer" == "X" -o "$answer" == "y" ]; then
    echo "源码根目录：/home/invoo2e/version/src/service-parent"
    cd /home/invoo2e/version/src/service-parent
    echo "源码更新[develop]：git pull "
    git checkout develop
    git pull
    echo ""
    echo "构建公共模块：service-invoo-server-dubbo-def"
    echo "cd /home/invoo2e/version/src/service-parent/service-invoo-server-dubbo-def"
    echo "mvn clean package install -U -P product-106 -Dmaven.test.skip=true"
    echo ""
            # cd /home/invoo2e/version/src/service-parent/service-invoo-server-dubbo-def
    mvn clean package install -U -P test-cloud -Dmaven.test.skip=true
    echo "*****************************service-invoo-server-dubbo-def 构建完成********************"
    echo ""
    echo "构建模块：service-invoo-server-$SHORT_NAME"
    echo "cd /home/invoo2e/version/src/service-parent/service-invoo-server-$SHORT_NAME"
    echo "mvn clean package install -U -P product-1.0.1 -Dmaven.test.skip=true"
    echo ""
            # cd /home/invoo2e/version/src/service-parent/service-invoo-server-$SHORT_NAME
    # mvn clean package install -U -P product-1.0.1 -Dmaven.test.skip=true
    echo ""
    echo "*****************************构建完成***************************************************"
    fi


################备份文件#########################
    echo ""
    echo -e "是否执行备份[service-invoo-server-$SHORT_NAME-1.0](Y): \c"
    read answer
if [ "$answer" == "Y" -o "X$answer" == "X" -o "$answer" == "y" ]; then
    mkdir -p $PROJECT_PATH/bak
            bakfile="$PROJECT_PATH/bak/service-invoo-server-$SHORT_NAME-1.0.jar.`date +%Y%m%d%H%M%S;`"
    cp -rf "$PROJECT_PATH/service-invoo-server-$SHORT_NAME-1.0.jar" $bakfile
    echo "备份完成：$bakfile"
    echo ""
    fi
#################文件拷贝#######################

    echo "****************************************************************************************"

    cp -rf /home/invoo2e/version/src/service-parent/service-invoo-server-$SHORT_NAME/target/service-invoo-server-$SHORT_NAME-1.0.jar $PROJECT_PATH/

    echo ""
    echo "拷贝完成：$PROJECT_PATH/service-invoo-server-$SHORT_NAME-1.0.jar"
    echo ""

    echo "****************************************************************************************"
    echo ""
    echo -e "是否重启服务(Y/N): \c"
    read answer
if [ "$answer" == "y" -o "$answer" == "Y" -o "$answer" == "yes" -o "$answer" == "YES" ]; then
    PID=`ps -ef | grep java | grep service-invoo-server-$SHORT_NAME-1.0.jar | grep -v "grep" | awk '{print $2}'`
            if [ "X$PID" == "X" ]; then
    echo "服务[service-invoo-server-$SHORT_NAME-1.0]尚未启动!"
            else
    echo "准备结束进程: $PID"
    kill -9 $PID
    echo "已终止进程: $PID"
    fi
    echo ""
    echo "启动服务[service-invoo-server-$SHORT_NAME-1.0]..."
    echo "nohup java -jar $PROJECT_PATH/service-invoo-server-$SHORT_NAME-1.0.jar >/dev/null 2>&1 &"
    nohup java -jar $PROJECT_PATH/service-invoo-server-$SHORT_NAME-1.0.jar >/dev/null 2>&1 &
    echo -e "启动中...\c"
    chk_times=0
            while [ $chk_times -le 10 ]
            do
    echo -e "..\c"
    sleep 2
            ((chk_times++))
    PID=`ps -ef | grep java | grep service-invoo-server-$SHORT_NAME-1.0.jar | grep -v "grep" | awk '{print $2}'`
            if [ "X$PID" != "X" ]; then
        break
    fi
            done
    echo ""
    echo "服务[service-invoo-server-$SHORT_NAME-1.0]已启动，新进程: $PID"
    echo "执行完毕"
    echo ""
    echo "**************************************FINISH********************************************"
    echo ""
    exit 0
            else
    echo "执行完毕"
    echo ""
    echo "**************************************FINISH********************************************"
    echo ""
    exit 0
    fi
