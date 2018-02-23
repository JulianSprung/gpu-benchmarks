#! /bin/sh

#define blender sw
blender=blender

#https://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-x86_64.tar.bz2

mkdir result_logs

# run the cycles benchmarks
for bm_dir in bmw27 pabellon_barcelona classroom
do
	time $blender benchmark/$bm_dir/*_gpu.blend -b -o result_logs/$bm_dir#### -f 1..5 |& tee "result_logs/${bm_dir}.txt"
done

#run the gooseberry benchmark
bm_dir=gooseberry
time $blender benchmark/$bm_dir/*.blend -b -o result_logs/$bm_dir#### -f 1..2 |& tee "result_logs/${bm_dir}.txt"


