FROM java:8

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD . /backend
WORKDIR /backend
ARG JAR_FILE
COPY target/ruoyi-common-3.8.7.jar /backend/ruoyi-common-3.8.7.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","-Duser.timezone=Asia/Shanghai", "ruoyi-common-3.8.7.jar"]

