#!/usr/bin/bash
#
# https://blog.csdn.net/weixin_57672329/article/details/120301307
# C++环境
# 为编译所依赖的 JNI 模块,需要安装 c++ 编译器和 cmake 生成器
yum remove cmake -y
yum install -y centos-release-scl
yum install -y devtoolset-7-gcc-c++
curl -L  https://github.com/crkmythical/Misc/raw/main/DevEnv/cmake-3.15.3-Linux-x86_64.tar.gz | tar zx -C /tmp
export PATH=/tmp/cmake-3.15.3-Linux-x86_64/bin:$PATH

# Java环境
## jdk-6u45-linux-x64.bin
curl -L https://github.com/crkmythical/Misc/raw/main/DevEnv/jdk-6u45-linux-x64-rpm.bin -O && chmod +x  jdk-6u45-linux-x64-rpm.bin && ./jdk-6u45-linux-x64-rpm.bin  && rm -f jdk-6u45-linux-x64-rpm.bin sun*.rpm jdk*.rpm
# 卸载
#rpm -e --nodeps `rpm -q jdk`
## maven
curl -L https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.2.3/apache-maven-3.2.3-bin.tar.gz  | tar zx -C /tmp


cat << EOF >> /etc/profile

# cmake
export PATH=/tmp/cmake-3.15.3-Linux-x86_64/bin:$PATH
# jdk1.6
export JAVA_HOME=/usr/java/jdk1.6.0_45
export JAVA_BIN=/usr/java/jdk1.6.0_45/bin
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME JAVA_BIN PATH CLASSPATH

# maven
export PATH=/tmp/apache-maven-3.2.3/bin:$PATH

EOF

. /etc/profile
java -version
javac -version
