FROM google/cloud-sdk:latest
LABEL maintainer="people@helloink.co"

RUN ["apt-get", "install", "google-cloud-sdk-firestore-emulator"]

EXPOSE 8940

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore"]
CMD ["start", "--host-port=0.0.0.0:8940", "--project=local"]
