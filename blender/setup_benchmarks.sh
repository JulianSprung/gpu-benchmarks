#! /bin/bash

# Get the blender cycles benchmark files
wget https://download.blender.org/demo/test/cycles_benchmark_20160228.zip
unzip cycles_benchmark_20160228.zip
rm cycles_benchmark_20160228.zip

# Get the blender gooseberry benchmark files and cleanup
wget http://download.blender.org/demo/test/benchmark.zip
unzip benchmark.zip  -d ./gooseberry
rm benchmark.zip
mv ./gooseberry/benchmark/* ./gooseberry/
rm -r ./gooseberry/benchmark
mv gooseberry benchmark/gooseberry
mv benchmark/gooseberry/benchmark.blend benchmark/gooseberry/gooseberry.blend