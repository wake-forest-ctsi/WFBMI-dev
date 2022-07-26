---
date_revised: 2022/06/15
revised_by: wfordwfu
---

# WFBMI Jupyter Lab Devcontainer

A Jupyter devcontainer datascience solution based on the [Jupyter/Docker-Stacks](https://github.com/jupyter/docker-stacks) solution.

- [WFBMI Jupyter Lab Devcontainer](#wfbmi-jupyter-lab-devcontainer)
  - [Getting Started](#getting-started)
    - [Tools to install locally](#tools-to-install-locally)
  - [Useful Docker commands to know](#useful-docker-commands-to-know)
  - [Jupyter commands](#jupyter-commands)
  - [Other helpful things:](#other-helpful-things)
  - [Jupyter Magics](#jupyter-magics)
  - [Issues](#issues)
  - [Reference](#reference)

## Getting Started

### Access Jupyter Lab

- Make sure server is running `jupyter server list`
- From shell run `./jupyter.sh` or go to [http://localhost:8888/lab](http://localhost:8888/lab)

### Tools to install locally

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) - Ideally install from Software Center
- [VS Code](https://code.visualstudio.com/download)
- [VS Code Remote Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Useful Docker commands to know (Run outside VS Code)

These are useful if you JupyterLab instance has locked up

- `docker ps` list running containers
- `docker kill $(docker ps -q)` stop any running containers
- `docker rm $(docker ps -aq)` remove any stopped containers
- `docker logs wfbmi-dev` If you need to get the url\token to log back into your instance

## Jupyter commands

Start here: [How to use Jupyter Lab (YouTube)](https://www.youtube.com/watch?v=A5YyoCKxEOU)

Think of a jupyter notebook interface like VIM lite.  You can use your mouse, but you can navigate jupyter via keyboard much faster.

- To enter a cell: enter
- To run a cell: ctrl-enter
- To run a cell and create a new one: shift-enter
- To exit a cell back to command mode: escape

When in command mode you have commands like this:

- Basic navigation: enter, shift-enter, up/k, down/j
- Saving the notebook: s
- Change Cell types: y, m, 1-6, t
- Cell creation: a, b
- Cell editing: x, c, v, d, z
- Kernel operations: i, 0 (press twice)

## Other helpful things:

- If you need a package and it's not installed, you can run `pip install x` directly within a code cell.  Jupyter will know what to do.
- If you need help with a function you can type it into a cell followed by ? and run `print?`
- While writing code, hitting Tab will display hints

## Jupyter Magics

Lots to learn here, but this is a good starting list

- `%lsmagic` list of magic commands.
- `%run <file name>.py` to run an external python file within your jupyter notebook.
- `%%time` at the top of a code block will return the execution time
- `%who` list all the current variables in a notebook
- `%pinfo <variable>` query specifics about a given variable in a notebook
- `%env` list all the environment variables
- `%env FOO=Bar` set the value of a new environment variable


There's lots more to explore about Jupyter:

- Check out the help menu in JupyterLab
- [Jupyter lab docs](https://jupyterlab.readthedocs.io/en/stable/getting_started/overview.html)
- [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
- [jupyter notebook docs](https://jupyter-notebook.readthedocs.io/en/stable/index.html)
- [jupyter docker stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
- [Example Notebooks](https://nbviewer.jupyter.org/github/jupyter/notebook/tree/master/docs/source/examples/Notebook/)

## Issues

- [nbconvert changed a value in version 6.0 and many jupyter related packages haven't updated](https://nbconvert.readthedocs.io/en/latest/changelog.html#id22)
  - Example error "Config option `template_path` not recognized by `*`.  Did you mean one of: `extra_template_paths, template_name, template_paths`?"


## Reference

- [Devcontainer Spec](https://containers.dev)
- [Based on the Microsoft provided mod of datascience jupyter stack](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/jupyter-datascience-notebooks)
- [Devcontainer/CLI](https://github.com/devcontainers/cli)

## Feature Ideas

- [xeus-sqlite](https://xeus-sqlite.readthedocs.io/en/latest/index.html)
  - `conda install xeus-sqlite jupyterlab -c conda-forge`