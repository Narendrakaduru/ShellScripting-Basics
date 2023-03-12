java_v=$(java -version 2>&1 | grep "version" | awk -F '"' '{print $2}')
echo "The version of java is: $java_v"
