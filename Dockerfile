FROM texlive/texlive
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -q && apt-get -yq upgrade 
WORKDIR /data
VOLUME ["/data"]
