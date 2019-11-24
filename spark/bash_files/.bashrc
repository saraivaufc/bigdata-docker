# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Java
export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_40


# SET HADOOP
export SPARK_HOME=/opt/spark

# PATH
export PATH=${PATH}:${JAVA_HOME}/bin:${SPARK_HOME}/bin