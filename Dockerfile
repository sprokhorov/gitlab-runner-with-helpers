FROM golang AS build
RUN go get -u github.com/GoogleCloudPlatform/docker-credential-gcr && \
    cd $GOPATH/src/github.com/GoogleCloudPlatform/docker-credential-gcr && \
    make && mv ./bin/docker-credential-gcr /opt/


FROM gitlab/gitlab-runner:ubuntu-v12.4.1
COPY --from=build /opt/docker-credential-gcr /usr/bin/

