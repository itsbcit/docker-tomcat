config_path=${CONFIG_PATH:-/config}
dest_path=${TOMCAT_CONFIG_PATH:-/usr/local/tomcat/conf}

if [ -d $config_path ]; then
    for f in $(find -L ${config_path} -maxdepth 1 -type f);do
      cp -fv $f ${dest_path}/
    done
fi
