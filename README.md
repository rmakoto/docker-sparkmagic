# docker-sparkmagic
Docker image based on [jupyter/scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) with [sparkmagic](https://github.com/jupyter-incubator/sparkmagic) configured to work with remote Spark clusters through [Livy](https://livy.incubator.apache.org/), a Spark REST server.

## How to run
```
docker build -t docker-sparkmagic .
docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work docker-sparkmagic
```
