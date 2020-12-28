# docker-sparkmagic
Docker image based on [jupyter/scipy-notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) with [sparkmagic](https://github.com/jupyter-incubator/sparkmagic) configured to work with remote Spark clusters through [Livy](https://livy.incubator.apache.org/), a Spark REST server.

## How to run
```
docker build -t docker-sparkmagic .
docker run --rm -p 8888:8888 -v "$HOME":/home/jovyan/work docker-sparkmagic
```

Or you can create a `config.json` from `example_config.json`, fill it with your pre-defined parameters and start a Jupyter Notebook through `docker-compose`:
```
docker-compose build && docker-compose up -d
```