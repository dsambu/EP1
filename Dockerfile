FROM mcr.microsoft.com/openjdk/jdk:21-mariner

WORKDIR /home/app
COPY HelloWorld
USER app

CMD ["java", "-jar", "/opt/app/HelloWorld"]
