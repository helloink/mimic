FROM debian:latest
LABEL maintainer="people@helloink.co"

RUN apt-get update && apt-get install -y \
    curl    \
    python  \
    default-jre

ENV SDK_VERSION=292.0.0

RUN mkdir /a
WORKDIR /a

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz
RUN tar zxvf google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz google-cloud-sdk
RUN ./google-cloud-sdk/install.sh -q

RUN /a/google-cloud-sdk/bin/gcloud config set disable_usage_reporting true
RUN /a/google-cloud-sdk/bin/gcloud components install beta cloud-firestore-emulator

ENTRYPOINT ["/a/google-cloud-sdk/bin/gcloud", "beta", "emulators", "firestore"]
CMD ["start", "--host-port=0.0.0.0:8940"]
