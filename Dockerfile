FROM quay.io/jupyter/datascience-notebook:lab-4.4.9
USER root

# Install s6-overlay
ENV S6_OVERLAY_VERSION="3.2.1.0"
RUN curl -sfLo - https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz | tar -Jxpf - -C /
RUN curl -sfLo - https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz | tar -Jxpf - -C /

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

RUN echo 'jovyan ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/jovyan

RUN apt-get update \
  && apt-get install -y npm \
  && apt-get clean autoclean \
  && apt-get autoremove --yes \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

USER jovyan

COPY 01-intro-to-ai-engineering /tmp/workshops/01-intro-to-ai-engineering

USER root

# Copy s6-overlay configs
COPY s6-overlay /etc/s6-overlay

# S6 settings
ENV S6_VERBOSITY=1 \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME=0 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2

# Jupyter Port
EXPOSE 8888
# Inspector Port
EXPOSE 6274,6277

ENTRYPOINT ["/init"]

CMD ["sleep", "infinity"]
