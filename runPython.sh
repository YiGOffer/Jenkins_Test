#!/bin/sh
set -e
PACKAGER_EXECUTE_PATH=$WORKSPACE/$GIT_CHECKOUT_DIR/packaging/Packager.py
PACKING_CONFIG_PATH=$WORKSPACE/$GIT_CHECKOUT_DIR/packaging/Config.json
RELEASE_PATH=$WORKSPACE/$GIT_CHECKOUT_DIR/release_configs
CONFIGS_PATH=$WORKSPACE/$GIT_CHECKOUT_DIR/packaging/res/data/dacsagent/bin/configs
README=$WORKSPACE/$GIT_CHECKOUT_DIR/release_configs/README.md
SUCCEED="\e[32m Success!\e[39m"

# 设置$USER
export USER=root
# 创建$CONFIG_PATH
mkdir -p $CONFIGS_PATH
# 根据公司名替换configs
if [ -d $RELEASE_PATH/$business/configs ] ; then
    cp -r $RELEASE_PATH/$business/configs/* $CONFIGS_PATH/
    echo -e "cp -r $RELEASE_PATH/$business/configs/* $SUCCEED"
    cp ${README} ${CONFIGS_PATH}/
    echo -e "cp ${README} $SUCCEED"
else
    echo -e "$RELEASE_PATH/$business/configs does not \e[31mexist \e[39m !";exit 1;
fi
# 执行打包
if [ -f "$PACKAGER_EXECUTE_PATH" ]; then
	if [ ! -x "$PACKAGER_EXECUTE_PATH" ]; then
        chmod a+x $PACKAGER_EXECUTE_PATH;
	fi
    if [ ! -f "$PACKING_CONFIG_PATH"]; then
        $PACKAGER_EXECUTE_PATH
    fi
    $PACKAGER_EXECUTE_PATH
else 
	echo "$PACKAGER_EXECUTE_PATH not exist!"; exit 1;
fi
