FROM openjdk:17-ea-11-jdk-slim
WORKDIR /home/ubuntu/
COPY  target/co_work_final-0.1.war security.war
COPY  icecream.png icecream.png
ENTRYPOINT ["java","-jar","security.war"]