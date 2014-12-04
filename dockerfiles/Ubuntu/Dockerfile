# For Ubuntu pre-setup

FROM ubuntu:14.04
MAINTAINER Jerry Huang ((jerry54010@gmail.com))

# Install common packages
RUN apt-get update && apt-get install -y \
  wget \
  curl \
  git-core \
  vim \
  build-essential \
  libssl-dev \
  zsh \
  gcc \
  make 

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \ 
  apt-get autoremove -y

# Auto sync time
RUN sudo echo ntpdate ntp.ubuntu.com pool.ntp.org >> /etc/cron.daily/ntpdate && \
  sudo chmod 755 /etc/cron.daily/ntpdate

# Install Oh-my-zsh
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
  sed -i 's/.*robbyrussell.*/ZSH_THEME="bira"/g' ~/.zshrc