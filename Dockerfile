FROM maven:3-jdk-11 AS builder
RUN git clone 'https://github.com/Aparna-Puvvadi/SPC.git' && cd SPC && mvn clean package
FROM openjdk:11
LABEL author="aparna"
COPY --from=builder /SPC/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar" ]