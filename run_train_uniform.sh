#!/bin/bash

hp_path="hyper_parameter/hp_eef1nn.json"
model_name="EEF1NN"
#hp_path="hyper_parameter/hp_nrr.json"
#model_name="NRR"
#hp_path="hyper_parameter/hp_ndrr.json"
#model_name="NDRR"
num_samples=100
seed=42
min_value=1
max_value=2
#allocator="MEW"
num_agents=15
num_objects=5
train_data_path="andata_MUW_n${num_agents}m${num_objects}_g_agent_train.pth"
#train_data_path="andata_tmp.pth"
#"andata_MUW_n50m40_gc_agent_train.pth"
#"andata_MUW_n10_gc.pth"
#"traindata_MUW_n=10_m=20_c.pth"
#"real-world/sushi/traindata_MEW.pth"

cat $hp_path
echo $train_data_path

python3 train.py \
    --hyperparameter_path $hp_path\
    --model_name $model_name\
    --num_samples $num_samples\
    --num_agents $num_agents\
    --num_objects $num_objects\
    --seed $seed\
    --low $min_value\
    --high $max_value\
    --train_data_path $train_data_path\
    #--generator Uniform\
    #--allocator $allocator
