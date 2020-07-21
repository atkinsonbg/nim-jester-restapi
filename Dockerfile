FROM nimlang/nim:alpine as BUILD
RUN nimble -y install https://github.com/dom96/jester
COPY . .
RUN nim c --passL:-static -d:release api.nim

FROM scratch
COPY --from=BUILD api api
CMD ["./api"]  