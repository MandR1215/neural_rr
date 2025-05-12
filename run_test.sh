#!/bin/bash

test_seed=2
num_samples=100

allocator='MUW'
num_agents=15
num_objects=5
min_value=1
max_value=2
item_variant='c'
device='cpu'

#model_name="RR"
#hp_path="hyper_parameter/hp_nrr.json"
#model_path="train_results/NRR_2024-10-16_19-07-24.pt" # n=15
#model_path="train_results/NRR_2024-10-09_03-55-59.pt" # n=30

#model_name="NDRR"
#hp_path="hyper_parameter/hp_ndrr.json"
#model_path="train_results/NDRR_2024-10-09_12-42-20.pt"
#model_path="train_results/NDRR_2024-10-06_20-30-43.pt"

model_name="EEF1NN"
hp_path="hyper_parameter/hp_eef1nn.json"
model_path="train_results/EEF1NN_2024-10-16_19-12-35.pt" # n=15
#model_path="train_results/EEF1NN_2024-10-09_04-21-56.pt" # n=30

echo n=${num_agents}_m=${num_objects}_$model_name

model_name=$model_name
num_samples=$num_samples
seed=$test_seed
min_value=$min_value
max_value=$max_value
allocator=$allocator
num_agents=$num_agents
num_objects=$num_objects
csv_model_name=$model_name
#test_data_path="andata_MUW_n${num_agents}m${num_objects}_g_agent_val.pth"
test_data_path="andata_MUW_n${num_agents}m${num_objects}_g_agent_test.pth"
#test_data_path="andata_tmp_test_.pth"
#"andata_MUW_n10m5_c_agent_test.pth"
#"andata_MUW_n10m20_g_both.pth"
#"testdata_MEW_n=10_m=20_c.pth"
#"traindata_MUW_n=10_m=20_c.pth"

python3 test.py \
    --hyperparameter_path "$hp_path" \
    --model_path "$model_path"\
    --model_name "$model_name" \
    --num_samples "$num_samples" \
    --num_agents "$num_agents" \
    --num_objects "$num_objects" \
    --seed "$seed" \
    --low "$min_value" \
    --high "$max_value" \
    --generator "AverageNoise" \
    --allocator "$allocator"\
    --csv_model_name "$csv_model_name"\
    --metric Hamm rSCW EF1Hard\
    --test_data_path $test_data_path\
    --device 'cpu'\
    --save
