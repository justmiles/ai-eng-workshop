FROM ollama/ollama:latest AS downloader

RUN ollama serve & \
    sleep 5 && \
    ollama pull driaforall/tiny-agent-a:0.5b && \
    pkill ollama
    
FROM quay.io/jupyter/datascience-notebook:lab-4.4.9
USER root

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

RUN echo 'jovyan ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/jovyan

USER jovyan

RUN pip install litellm

# pre-cache some ollama models
COPY --from=downloader /root/.ollama /home/jovyan/.ollama

COPY 01-intro-to-ai-engineering /tmp/workshops/01-intro-to-ai-engineering

EXPOSE 8888

CMD ["jupyter", "lab", "--port=8888", "--no-browser"," --core-mode", "--ServerApp.token=''","--ServerApp.password=''"]
