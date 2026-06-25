FROM nvidia/cuda:13.2.1-cudnn-devel-ubuntu24.04

COPY --from=ghcr.io/astral-sh/uv:0.9.28 /uv /uvx /bin/

RUN apt update && \
    apt install -y \
        git \
        aria2 \
        wget \
        git \
        ffmpeg \
        curl \
        vim \
        unzip \
        python3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /workspace && mkdir /workspace
WORKDIR /workspace

RUN uv init --python 3.12 --seed && \
    uv pip install \
        yt-dlp \
        'moviepy<2' \
        tdqm \
        yt-dlp-ejs

# git clone https://github.com/eadwu/VFHQ-downloader.git
# cd VFHQ-downloader
# ln -sf /VFHQ/data data
## Download metadata
## https://1drv.ms/u/s!Ag1HH_EDGMqqh2i5sgNyHpcVldos?e=8wKFtV
# mkdir meta_info && cd meta_info && unzip ../meta_info.zip
# python main.py
