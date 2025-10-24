# Workshop

To run this workshop locally, launch it from your local workstation:

```bash
docker run --rm -name ai-eng-workshop \
  -v $PWD/work:/home/jovyan/work \
  -p 8888:8888 \
  docker.io/library/justmiles:ai-eng-workshop
```

Once launched, copy the example Jupyter notebooks into your `~/work` directory:

```bash
cp --update -r /tmp/workshops /home/jovyan/work/
```

Juper notebooks can be worked through in alphanumeric order.
