FROM ubuntu:latest

RUN apt-get update

RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update

RUN apt-get install -y neovim curl git

RUN curl https://dl.google.com/go/go1.14.3.linux-amd64.tar.gz --output go.tar.gz && tar -C /usr/local -xzf go.tar.gz

RUN useradd -m -s /bin/bash foobert

USER foobert

WORKDIR /home/foobert

ENV PATH $PATH:/usr/local/go/bin:/home/foobert/go/bin

ENV GO111MODULE on

RUN /usr/local/go/bin/go get golang.org/x/tools/gopls@latest

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN mkdir -p /home/foobert/.config/nvim

COPY --chown=foobert init.vim /home/foobert/.config/nvim/init.vim

RUN mkdir /home/foobert/test

WORKDIR /home/foobert/test

RUN go mod init foo

COPY --chown=foobert main.go /home/foobert/test
