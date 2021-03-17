FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
USER root
ADD py-requirements.txt /opt/py-requirements.txt
ADD r-requirements.txt /opt/r-requirements.txt
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends build-essential r-base python3.6 python3-pip python3-setuptools python3-dev
#RUN R -e "install.packages('shiny')"
RUN R -e 'install.packages(c(paste(readLines("/opt/r-requirements.txt"))))'
RUN pip3 install -r /opt/py-requirements.txt

ENTRYPOINT ["/bin/bash"]
