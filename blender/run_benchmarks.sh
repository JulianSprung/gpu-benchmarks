#! /bin/sh


# get a timestamp
ts="$(date +"%Y-%m-%d_%H-%M-%S")"

#define blender sw run cmd
#blender=blender
tag="2.79_cuda"
run_cmd="sudo docker run --rm --runtime=nvidia juliansprung/blender:${tag}"

#https://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-x86_64.tar.bz2

mkdir result_logs

# run the cycles benchmarks
for bm_dir in bmw27 pabellon_barcelona classroom
do
	for numberOfGPUs in 1 2 4 8 10
	do
		#run_cmd="sudo docker run --rm --runtime=nvidia -e NVIDIA_VISIBLE_DEVICES=0,1,2,3 juliansprung/blender:${tag}"
		time $run_cmd benchmark/$bm_dir/*_gpu.blend -b -o result_logs/$bm_dir#### -f 1..5 |& tee "result_logs/${ts}_${tag}__${bm_dir}.txt"
	done
done

#run the gooseberry benchmark
bm_dir=gooseberry
time $run_cmd benchmark/$bm_dir/*.blend -b -o result_logs/$bm_dir#### -f 1..2 |& tee "result_logs/${ts}_${tag}__${bm_dir}.txt"


