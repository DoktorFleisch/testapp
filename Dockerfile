FROM gradle:6.8-jdk11 as build
COPY . ./
RUN gradle --no-daemon clean bootJar

FROM gradle:6.8-jre11
WORKDIR /testapp
COPY --from=build /home/gradle/build/libs/*.jar app.jar
CMD -- java -jar app.jar

EXPOSE 8080