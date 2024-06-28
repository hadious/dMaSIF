FROM ubuntu:22.04
RUN apt install python3.10 python3.10-dev python3-dev python3.10-venv
RUN ./deps.sh