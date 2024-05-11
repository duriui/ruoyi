FROM java:8

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD . /backend
WORKDIR /backend
ARG JAR_FILE
COPY target/ruoyi-system-3.8.7.jar /backend/ruoyi-system-3.8.7.jar
EXPOSE 8086
ENTRYPOINT ["java","-jar","-Duser.timezone=Asia/Shanghai", "ruoyi-system-3.8.7.jar"]

