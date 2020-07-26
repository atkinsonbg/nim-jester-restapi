FROM nimlang/nim:latest as BUILD
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y musl musl-tools binutils upx curl build-essential
COPY . .
RUN nimble -y install
RUN nim musl -d:libressl ./src/api.nim

FROM scratch
COPY --from=BUILD ./src/api api
CMD ["./api"]  