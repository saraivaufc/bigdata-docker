# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# SET JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# SET HADOOP
export SPARK_HOME=/opt/spark

export IPYTHON=1
export PYSPARK_PYTHON=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"

# PATH
export PATH=${PATH}:${JAVA_HOME}:${SPARK_HOME}/bin
