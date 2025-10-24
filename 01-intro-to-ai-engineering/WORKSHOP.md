# Workshop

To run this workshop locally, launch it from your local workstation:

```bash
docker run --rm -name ai-eng-workshop \
  -v $PWD/work:/home/jovyan/work \
  -p 8888:8888 \
  justmiles/notebook:ai-eng-workshop
```

Once launched, copy the example Jupyter notebooks into your `~/work` directory:

```bash
cp --update -r /tmp/workshops /home/jovyan/work/
```

To progress through this workshop we need to launch ollama and ensure the models we want to work with are downloaded. This container ships with the latest version of Ollama, but you need to launch the server. To do so

- Select File -> New -> Terminal
- Run the command: `ollama serve`
- Launch a second terminal: File -> New -> Terminal
- Run the command: `ollama pull driaforall/tiny-agent-a:0.5b` to pull the model we'll use throughout this project

You can view the currently downloaded models with the command `ollama list`. View available models here: https://ollama.com/search

Juper notebooks can be worked through in alphanumeric order.
