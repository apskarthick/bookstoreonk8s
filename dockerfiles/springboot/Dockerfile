FROM openjdk:11
ARG JAR_FILE=update-book-css-v10.war
COPY ${JAR_FILE} app.war
ENTRYPOINT ["java","-jar", "/app.war"]
