# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# SET JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# SET HADOOP
export SPARK_HOME=/opt/spark

# SET HADOOP
export HADOOP_HOME="/opt/hadoop"
export HADOOP_USER_NAME="root"
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/libexec

# PATH
export PATH=${PATH}:${JAVA_HOME}:${SPARK_HOME}/bin:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${HADOOP_MAPRED_HOME}:${HADOOP_COMMON_HOME}:${HADOOP_HDFS_HOME}:${HADOOP_LIBEXEC_DIR}
