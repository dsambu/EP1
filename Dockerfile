FROM alpine:latest

ENV JAVA_HOME=/usr/lib/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin

# Default to UTF-8 file.encoding
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# (Optional) Add extra packages for fontconfig and ttf-dejavu to support server-side image generation
RUN apk add --no-cache fontconfig libretls musl-locales musl-locales-lang ttf-dejavu tzdata zlib \
    && rm -rf /var/cache/apk/*

# Download and extract JDK 17
RUN wget -nv -O jdk.tar.gz https://aka.ms/download-jdk/microsoft-jdk-17-alpine-x64.tar.gz && \
    mkdir $JAVA_HOME && \
    tar xf jdk.tar.gz -C $JAVA_HOME --strip-components 1 --no-same-owner

# Copy the application
COPY app.jar /app.jar

CMD [ "java", "-jar", "/app.jar" ]
