FROM debian:stable

WORKDIR /opt/rpi-documentation

ENV http_proxy="http://192.168.168.58:7891"
ENV https_proxy="http://192.168.168.58:7891"
RUN apt update && apt install -y ruby ruby-dev python3 python3-pip make ninja-build

RUN echo -e "export GEM_HOME=\"\$(ruby -e 'puts Gem.user_dir')\"\nexport PATH=\"\$PATH:\$GEM_HOME/bin\"" > /etc/profile.d/ruby.sh

RUN gem install bundler -v 2.2.15
COPY requirements.txt /tmp/requirements.txt
RUN pip install --requirement /tmp/requirements.txt