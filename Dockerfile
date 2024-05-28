FROM golang:alpine as build
WORKDIR /app
COPY ./main.go .
RUN go build main.go


FROM scratch as base
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT [ "./main" ]
