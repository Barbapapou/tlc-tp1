FROM alpine:latest
RUN apk add openjdk8-jre
RUN apk add maven
RUN apk add libpng
RUN apk add jasper
RUN apk add libdc1394
RUN apk add git
RUN git clone https://github.com/Barbapapou/TPDockerSampleApp.git
WORKDIR TPDockerSampleApp
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package
ENTRYPOINT ["java", "-Djava.library.path=lib/", "-jar", "target/fatjar-0.0.1-SNAPSHOT.jar"]
