FROM ubuntu:20.04

# Copy neovim config.
COPY init.vim /root/.config/nvim/init.vim

# - build-essential is required by some plugins that depend on gcc.
# - AppImage fails to run in container without FUSE. As a workaround, extract and
#   run the app.
# - Install golang using gimme.
# - nvim plugin installation results in error because of unknown options in
#   init.vim before installing the plugins. Add `|| true` to ignore the
#   failures.
# TODO: Run this as a non-root user to avoid file permission issues.
RUN apt-get update \
  && apt-get install -y --no-install-recommends build-essential \
    python3-setuptools python3-pip silversearcher-ag curl git \
  && curl -Lo ripgrep.deb \
  https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb \
  && dpkg -i ripgrep.deb && rm ripgrep.deb \
  && curl -Lo nvim https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage \
  && chmod +x nvim && ./nvim --appimage-extract \
  && ln -s /squashfs-root/AppRun /usr/local/bin/nvim \
  && pip3 install pynvim \
  && curl -fLo "/root/.local/share/nvim/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && curl -sL -o /usr/local/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme \
  && chmod +x /usr/local/bin/gimme && eval "$(gimme 1.14.6)" \
  && echo "eval \"\$(gimme 1.14.6)\"" >> /root/.bashrc \
  && nvim +PlugInstall +qall || true \
  && nvim +UpdateRemotePlugins +qall || true
