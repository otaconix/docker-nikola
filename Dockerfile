FROM base/archlinux
RUN pacman --noprogressbar --noconfirm -Sy archlinux-keyring && \
    pacman --noprogressbar --noconfirm -S \
        python \
        python-pip \
        python-lxml \
        python-pillow \
        ruby \
        sqlite \
        openssl && \
    pacman-db-upgrade && \
    pacman --noconfirm -Scc && \
    gem install --no-user-install asciidoctor && \
    gem install --no-user-install coderay && \
    pip install watchdog && \
    pip install ws4py && \
    pip install webassets && \
    pip install Nikola
ADD umask_wrapper /bin/umask_wrapper
RUN chmod +x /bin/umask_wrapper
VOLUME /sites
WORKDIR /sites
ENTRYPOINT ["/bin/umask_wrapper", "/usr/sbin/nikola"]
