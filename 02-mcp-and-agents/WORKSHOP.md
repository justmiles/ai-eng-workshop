# Workshop

To run this workshop locally, launch it from your local workstation:

```bash
docker run --rm --name ai-eng-workshop \
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

Jupiter notebooks can be worked through in alphanumeric order.

---------------------------------------------------------------------------------------------

Approach #2: Running this workshop locally by installing jupyter lab and download ollama in your PC. 

Step-by-step guide to install JupyterLab on your laptop (works for Windows, macOS, or Linux):

Option 1: 
  Using Anaconda (Recommended for beginners)
  Download and install Anaconda
  Go to: https://www.anaconda.com/download
  Download the installer for your OS (Windows/macOS/Linux)
  Follow the installation prompts.

Launch JupyterLab
  Open Anaconda Navigator → click Launch under JupyterLab
  OR
  Open your terminal / Anaconda Prompt and type:
  jupyter lab

It will open JupyterLab in your browser automatically.


Option 2: Using pip (for Python users without Anaconda)

pip install jupyterlab


Run JupyterLab

jupyter lab

This opens a browser window at:  http://localhost:8888/lab



Step-by-step guide to install OLLAMA on your laptop (works for Windows, macOS, or Linux):

1. Go to the official download page: download and Install 
2. In Terminal, verify with:

ollama --version 

download a model using 

ollama pull <model_name>
ollama run <model_name>


Ollama does not need you to specify a port manually — it just runs locally and communicates directly through the command line.
 However, in the background, Ollama also runs a local API server (so you can send requests from apps or Python code).

That API server typically listens on:

http://localhost:11434

This is the default port (11434) for Ollama’s local API.

To setup a custom port , set with environment variable OLLAMA_HOST
OLLAMA_HOST=0.0.0.0:8000
-----------------------

Clone miles git repo , to open those files in the notebook 

git clone [https://github.com/justmiles/ai-eng-workshop.git](https://github.com/justmiles/ai-eng-workshop.git)




