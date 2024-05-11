FROM java:8

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
ADD . /backend
WORKDIR /backend
ARG JAR_FILE
COPY target/ruoyi-framework-3.8.7.jar /backend/ruoyi-framework-3.8.7.jar
EXPOSE 8083
ENTRYPOINT ["java","-jar","-Duser.timezone=Asia/Shanghai", "ruoyi-framework-3.8.7.jar"]

