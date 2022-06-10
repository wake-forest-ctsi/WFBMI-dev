# See here for image contents: https://hub.docker.com/r/jupyter/datascience-notebook/
FROM jupyter/datascience-notebook:latest

USER root

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get -y install --no-install-recommends apt-utils g++ \
    dialog libaio1 libssl-dev \
    apt-transport-https ca-certificates

COPY certificates/* /usr/local/share/ca-certificates/

RUN update-ca-certificates

# We want to run common-debian.sh from here:
# https://github.com/microsoft/vscode-dev-containers/tree/main/script-library#development-container-scripts
# But that script assumes that the main non-root user (in this case jovyan)
# is in a group with the same name (in this case jovyan).  So we must first make that so.

COPY library-scripts/common-debian.sh /tmp/library-scripts/

RUN apt-get update && \
    groupadd jovyan && \
    usermod -g jovyan -a -G users jovyan && \
    bash /tmp/library-scripts/common-debian.sh && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# add additional features
RUN apt-get update && apt-get -y install --no-install-recommends \
    powerline fonts-powerline tree lynx neofetch tldr strace xdg-utils pandoc && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# [Optional] If your pip requirements rarely change, uncomment this section to add them to the image.
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt && \
    pip3 --disable-pip-version-check --no-cache-dir install jupyter_contrib_nbextensions && \
    rm -rf /tmp/pip-tmp && \
    jupyter contrib nbextension install --user && \
    # can modify or enable additional extensions here
    jupyter nbextension enable spellchecker/main --user && \
    #jupyter labextension install @jupyterlab/dataregistry-extension --user && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER jovyan

# Configure container startup
#ENTRYPOINT ["tini", "-g", "--"]
CMD ["JUPYTER_ENABLE_LAB=yes", "GRANT_SUDO=yes", "start.sh", "jupyter", "lab", "--LabApp.token=''"]