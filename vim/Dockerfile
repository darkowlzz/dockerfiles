# Vim in a container
#
# docker run -ti --rm \
#       -v $PWD:/root/code \
#       vim filename.txt

FROM alpine

# Copy vimrc
COPY ./vimrc /root/.vimrc

# Install vim and git. Clone Vundle and theme (beforehand). Install vim plugins.
# Delete git.
RUN apk update && apk add vim git \
      && git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim \
      && git clone https://github.com/lanox/lanox-vim-theme.git /root/.vim/bundle/lanox-vim-theme \
      && vim +PluginInstall +qall \
      && apk del git

WORKDIR /root/code

ENTRYPOINT ["vim"]
