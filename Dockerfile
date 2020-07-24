FROM nimlang/nim:latest as BUILD
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y musl musl-tools binutils upx
COPY . .
RUN nimble -y install
RUN nim c --gcc.exe:musl-gcc --gcc.linkerexe:musl-gcc --passL:-static -d:ssl -d:release --opt:size ./src/api.nim
RUN strip -s ./src/api
RUN upx --best ./src/api

FROM scratch
COPY --from=BUILD ./src/api api
CMD ["./api"]  