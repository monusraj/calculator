FROM abrtech/alpine-oraclejdk8:latest
COPY build/libs/TestGradle_Jenkinsfile-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
