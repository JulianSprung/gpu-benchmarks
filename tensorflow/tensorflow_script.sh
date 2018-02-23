#! /bin/bash

#if [$# -gt 0 ]
#then
#	
#fi

# get a timestamp
ts="$(date +"%Y-%m-%d_%H-%M-%S")"

mkdir result_logs

#define tensorflow sw run cmd
tag="v1.18-2-23"
run_cmd="sudo docker run --rm --runtime=nvidia juliansprung/tensorflow_cnn_benchmark:${tag}"

# define variables
variableUpdate=parameter_server
localParameterDevice=cpu

for batchSize in 32 64
do
	for model in resnet50 inception3
	do
	  for numberOfGPUs in 1 2 4 8 10
	  do
		args="-m tf_cnn_benchmarks --num_gpus=${numberOfGPUs} --batch_size=${batchSize} --model=${model} --local_parameter_device=${localParameterDevice} --variable_update=${variableUpdate}"
		$run_cmd python3 $args  |& tee "result_logs/${ts}_${tag}__${model}_${numberOfGPUs}_${batchSize}_${localParameterDevice}.txt"
	  done
	done
done
