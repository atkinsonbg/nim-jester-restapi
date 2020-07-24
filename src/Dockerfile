FROM nimlang/nim:latest as BUILD
RUN nimble -y install https://github.com/dom96/jester
RUN nimble -y install https://github.com/status-im/nim-chronicles
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y musl musl-tools binutils upx
COPY . .
#RUN nim c --passL:-static -d:release api.nim
RUN nim c --gcc.exe:musl-gcc --gcc.linkerexe:musl-gcc --passL:-static -d:ssl -d:release --opt:size api.nim
RUN strip -s ./api
RUN upx --best ./api

FROM scratch
COPY --from=BUILD api api
CMD ["./api"]  