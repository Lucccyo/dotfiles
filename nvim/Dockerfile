FROM archlinux:latest

ENV LANG=C.UTF-8 \
    TERM=xterm-256color \
    COLORTERM=truecolor

RUN pacman -Syu --noconfirm --needed \
      neovim \
      git \
      base-devel \
      ripgrep \
      fd \
      tree-sitter-cli \
      curl \
      wget \
      unzip \
      tar \
      gzip \
      cmake \
      clang \
      nodejs \
      npm \
      cargo \
    && pacman -Scc --noconfirm

RUN useradd -m -s /bin/bash dev
USER dev
WORKDIR /home/dev

COPY --chown=dev:dev nvim/ /home/dev/.config/nvim/
COPY --chown=dev:dev docker/bootstrap.lua /tmp/bootstrap.lua

RUN nvim --headless "+Lazy! sync" +qa \
    && nvim --headless -c "luafile /tmp/bootstrap.lua" -c "qa"

COPY --chown=dev:dev workspace/ /home/dev/workspace/
WORKDIR /home/dev/workspace

CMD ["bash"]
