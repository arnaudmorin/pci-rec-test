FROM centos:centos7.9.2009 as builder
COPY app /
# be sure app can be executed
RUN chmod +x /app

# find dependencies of app
RUN  ldd ./app  \
    | grep so \
    | sed -e '/^[^\t]/ d' \
    | sed -e 's/\t//' \
    | sed -e 's/.*=..//' \
    | sed -e 's/ (0.*)//' \
    | sort \
    | uniq  \
    > /app_and_deps.log

# append app itself
RUN echo "/app" >> /app_and_deps.log 

# collect all together under one dir
RUN mkdir -p /app_and_deps && \
  cp $( cat /app_and_deps.log ) /app_and_deps/.

FROM scratch
# extract minimal set of app & libs in target container
COPY --from=builder /app_and_deps/. /
CMD ["/app"]
