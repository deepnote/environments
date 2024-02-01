#!/bin/bash

CUDA_TAG=$1

if [[ -z "$1" ]];then
    CUDA_TAG="11.4.3-runtime-ubuntu20.04"
fi

V1=$(echo $CUDA_TAG | awk -F "." {print'$1'})
V2=$(echo $CUDA_TAG | awk -F "." {print'$2'})

CUDA_VER=$V1"."$V2
CUDNN_VER=$(apt list -a libcudnn8 | grep $CUDA_VER | head -1 | awk -F " " {print'$2'})

apt-get install -y libcudnn8=$CUDNN_VER

NVINFER_VER=$(apt list -a libnvinfer8 | grep $CUDA_VER | head -1 | awk -F " " {print'$2'})

apt-get install -y libnvinfer8=$NVINFER_VER