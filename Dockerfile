# Dockerfile
FROM python:3.7-alpine

ARG SPARK_VERSION=2.4.5
ARG HADOOP_VERSION=2.7

RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
 && tar xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C / \
 && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
 && ln -s /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark

RUN apk add shell coreutils procps
RUN apk fetch openjdk8
RUN apk add openjdk8
RUN pip3 install ipython

ENV PYSPARK_DRIVER_PYTHON ipython