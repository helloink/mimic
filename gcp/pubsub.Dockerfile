FROM google/cloud-sdk:latest
LABEL maintainer="people@helloink.co"

EXPOSE 8538
VOLUME /data

ENTRYPOINT ["gcloud", "beta", "emulators", "pubsub"]
CMD ["start", "--host-port=0.0.0.0:8538", "--data-dir=/data", "--project=local"]
