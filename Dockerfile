
FROM ubuntu:22.04


RUN apt update && apt install -y \
    python3.10 \
    python3.10-dev \
    python3-dev \
    python3.10-venv \
    python3-pip \
    wget \
    nano



COPY deps.sh .
RUN chmod +x ./deps.sh && ./deps.sh


RUN apt update && apt install -y libxml2


RUN wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda_12.1.1_530.30.02_linux.run &&\
    sh cuda_12.1.1_530.30.02_linux.run --silent --toolkit


ENV LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH"
ENV PATH="/usr/local/cuda-12.1/bin:$PATH"

WORKDIR /app
COPY . /app
EXPOSE 8080



# FROM ubuntu:22.04
# RUN apt update && apt install -y python3.10 python3.10-dev python3-dev python3.10-venv python3-pip wget
# COPY deps.sh .
# RUN chmod +x ./deps.sh && ./deps.sh
# RUN apt update && apt install -y libxml2
# RUN wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda_12.1.1_530.30.02_linux.run &&\
#     sh cuda_12.1.1_530.30.02_linux.run --silent --toolkit
# ENV LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH"
# ENV PATH="/usr/local/cuda-12.1/bin:$PATH"



# Build:
# docker build -t dmasif:0.0.1 .

# Run:
# sudo docker run -it --runtime=nvidia --gpus all -p 8080:8080 -v ./dMaSIF:/app dmasif:0.0.1
# Line 14 benchmark_models => Net


# in data
#def __cat_dim__(self, key, value, *args, **kwargs):
#     pass
  
# def __inc__(self, key, value, *args, **kwargs):
#     pass

# python main_inference.py --experiment_name EXP1 --pdb_list pdb_list.txt --device cuda:0
# python main_inference.py --experiment_name MyExperiment --single_pdb 1ABC_A_B --device cuda:0

