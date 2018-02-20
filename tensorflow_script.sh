#! /bin/bash
mkdir result_logs

batchSize=32
variableUpdate=parameter_server
localParameterDevice=cpu

for model in resnet50 inception3
do
  for numberOfGPUs in 1 2 4 8 10
  do
    sudo docker run -it --rm --runtime=nvidia tf_bench_x python -m tf_cnn_benchmarks --num_gpus=$numberOfGPUs --batch_size=$batchSize --model=$model --local_parameter_device=$localParameterDevice --variable_update=$variableUpdate  |& tee "result_logs/${model}_${numberOfGPUs}_${batchSize}_${localParameterDevice}.txt"
  done
done
