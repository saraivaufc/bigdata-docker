#FROM ubuntu:18.04
FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

MAINTAINER saraivaufc <www.saraiva.dev>

WORKDIR /opt/

RUN apt-get -qq update -y

RUN apt-get -qqy install axel openssh-server openssh-client sudo

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

# SSH Keys
RUN mkdir -p /root/.ssh/
COPY ./ssh_keys/* /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 0600 /root/.ssh/id_rsa
RUN /usr/bin/ssh-keygen -A

# To download Spark
RUN axel https://archive.apache.org/dist/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz
RUN tar -xvzf spark-3.0.1-bin-hadoop3.2.tgz
RUN mv spark-3.0.1-bin-hadoop3.2 ./spark

# To download Java
RUN apt-get update && apt install -y openjdk-11-jdk

# To download PySpark
RUN apt-get -qqy install python3-dev python3-pip
RUN pip3 install pyspark==2.4.4

# To Install Scala
RUN apt-get install -y scala

# To Install Jupyter
RUN apt-get update -y
RUN pip3 install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# To Install Scala Kernel to Jupyter
RUN pip3 install spylon-kernel
RUN python3 -m spylon_kernel install

# Configure Jupyter
RUN mkdir notebook
RUN mkdir -p /root/.jupyter
RUN echo "from IPython.lib import passwd;c.NotebookApp.password = passwd('secret')" >> /root/.jupyter/jupyter_notebook_config.py

# To install graphviz
RUN apt install -y graphviz

# To install GDAL
RUN apt update && apt install -y libgdal-dev gdal-bin

RUN pip3 install GDAL==$(gdal-config --version) --global-option=build_ext --global-option="-I/usr/include/gdal"

# BASH FILES
COPY ./bash_files/* /root/

# COPY ENVIROMENT VARIABLES
#COPY ./spark-env.sh ./spark/conf/
#COPY ./spark-defaults.conf ./spark/conf/
#COPY ./getGpusResources.sh ./spark/conf/

# ENTRYPOINT
COPY ./docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

# PORTS
EXPOSE 7077 8080 22 4040 8998

# Expose Jupyter port
EXPOSE 8899
