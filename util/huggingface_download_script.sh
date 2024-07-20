#!/bin/bash

#-------------------datasets are downloaded by `load_dataset` and stored in  ~/.cache/huggingface/datasets, this script is not useful!----------------

# Define the list
my_list=(
    "liuhaotian/llava-"
    "lmsys/vicuna-"
)

# Iterate through the list
for element in "${my_list[@]}"
do
    echo "-----------------downloading $element---------"
    huggingface-cli download $element #--repo-type dataset for datasets
done