FROM jagregory/busted

RUN apt-get update
RUN apt-get install -y build-essential

RUN wget --no-check-certificate https://luarocks.org/releases/luarocks-2.4.3.tar.gz
RUN tar zxpf luarocks-2.4.3.tar.gz
RUN cd luarocks-2.4.3
WORKDIR /source/luarocks-2.4.3
RUN pwd
RUN ./configure
RUN make bootstrap
WORKDIR /source
RUN sudo luarocks install lua-cjson
