FROM eclipse-temurin:8-jdk

RUN apt-get update && apt-get install python3 -y && rm -rf /var/lib/apt/lists/*

RUN wget https://datax-opensource.oss-cn-hangzhou.aliyuncs.com/202309/datax.tar.gz && tar -xzvf datax.tar.gz

WORKDIR ./datax