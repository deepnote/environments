#!/bin/bash

CUDA_TAG=$1

if [[ -z "$1" ]];then
    CUDA_TAG="11.4.3-runtime-ubuntu20.04"
fi

V1=$(echo $CUDA_TAG | awk -F "." {print'$1'})
V2=$(echo $CUDA_TAG | awk -F "." {print'$2'})

CUDA_VER=$V1"."$V2
CUDA_VER_DASH=$V1"-"$V2
CUDNN_VER=$(apt list -a libcudnn8 | grep $CUDA_VER | head -1 | awk -F " " {print'$2'})

apt-get install -y libcudnn8=$CUDNN_VER

NVINFER_VER=$(apt list -a libnvinfer8 | grep $CUDA_VER | head -1 | awk -F " " {print'$2'})

apt-get install -y \
    libcudnn8=$CUDNN_VER \
    libnvinfer-plugin8=$NVINFER_VER \
    libnvinfer8=$NVINFER_VER \
    cuda-command-line-tools-$CUDA_VER_DASH \
    cuda-cudart-dev-$CUDA_VER_DASH \
    cuda-nvcc-$CUDA_VER_DASH \
    cuda-cupti-$CUDA_VER_DASH \
    cuda-nvprune-$CUDA_VER_DASH \
    cuda-libraries-$CUDA_VER_DASH \
    cuda-nvrtc-$CUDA_VER_DASH \
    libcufft-$CUDA_VER_DASH \
    libcurand-$CUDA_VER_DASH \
    libcusolver-$CUDA_VER_DASH \
    libcusparse-$CUDA_VER_DASH \
    libcublas-$CUDA_VER_DASH