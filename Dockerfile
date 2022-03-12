#

FROM gitpod/openvscode-server:1.65.2

#RUN # the installation process for software needed


#FROM ubuntu:20.04
USER root
RUN apt-get -y update -q && apt-get install -y git curl unzip jq docker.io make build-essential tmux zlib1g-dev libssl-dev libffi-dev

USER openvscode-server
COPY shasum /bin/shasum
COPY asdf-install-plugins /bin/asdf-install-plugins
RUN git clone -b v0.9.0 https://github.com/asdf-vm/asdf.git /home/workspace/.asdf
WORKDIR /home/workspace
RUN echo '\nsource $HOME/.asdf/asdf.sh' >> /home/workspace/.bashrc
RUN echo '\neval "$(ssh-agent -s)"' >> /home/workspace/.bashrc
RUN echo '\nssh-add ~/.ssh/id_ed25519' >> /home/workspace/.bashrc
COPY .tool-versions .tool-versions
COPY setup.sh setup.sh
RUN ["bash", "-c", "source $HOME/.asdf/asdf.sh; ./setup.sh"]
RUN rm setup.sh
RUN code --install-extension golang.go

