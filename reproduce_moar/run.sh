# Medec
mv medic.json.txt medec.json && \
python docetl/experiments/reasoning/run_moar.py \
    --yaml_path medec.yaml \
    --dataset_path medec.json \
    --experiment_name medec_moar \
    --model gpt-5 \
    --available_models gpt-5 gpt-5-mini gpt-5-nano gpt-4.1-mini gpt-4.1-nano gpt-4o-mini \
    --dataset medec

# BlackVault
mv blackvault.json.txt blackvault.json && \
python docetl/experiments/reasoning/run_moar.py \
    --yaml_path blackvault.yaml \
    --dataset_path blackvault.json \
    --experiment_name blackvault_moar \
    --model gpt-5 \
    --available_models gpt-5 gpt-5-mini gpt-5-nano gpt-4.1-mini gpt-4.1-nano gpt-4o-mini \
    --dataset blackvault
