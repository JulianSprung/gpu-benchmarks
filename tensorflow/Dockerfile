FROM tensorflow/tensorflow:nightly-gpu

RUN apt-get update && apt-get install -y python-pip && pip install google-cloud
COPY benchmark/scripts/tf_cnn_benchmarks/ ./tf_cnn_benchmarks/
RUN touch tf_cnn_benchmarks/__init__.py
RUN touch tf_cnn_benchmarks/models/__init__.py
RUN mkdir ./util/
COPY benchmark/scripts/util/ ./util/

WORKDIR tf_cnn_benchmarks
ENTRYPOINT ["bash"]