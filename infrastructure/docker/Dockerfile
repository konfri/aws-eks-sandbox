FROM adoptopenjdk/openjdk11:alpine-jre
RUN apk update && apk upgrade
COPY application/build/libs/hackathon.jar .
EXPOSE 8080
CMD ["java", "-jar", "hackathon.jar"]