FROM java:8

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD . /backend
WORKDIR /backend
ARG JAR_FILE
COPY target/ruoyi-admin.jar /backend/ruoyi-admin.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","-Duser.timezone=Asia/Shanghai", "ruoyi-admin.jar"]

