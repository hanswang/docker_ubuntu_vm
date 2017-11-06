FROM phusion/baseimage:0.9.19

# Update mirror
RUN \
    sed -i 's/archive.ubuntu.com/mirror.optus.net/g' /etc/apt/sources.list && \
    apt-get update

# Install Python.
RUN \
    apt-get install -y python python-dev python-pip python-virtualenv

# Install ssh git vim
RUN \
    apt-get install -y ssh git vim

# Install crypto.
RUN \
    apt-get install -y build-essential libssl-dev libffi-dev

# Configs for git
RUN \
    echo '[user]\n\
	name = "Hans.W"\n\
	email = hanswang2012@gmail.com\n\
[alias]\n\
	st = status\n\
	ci = commit\n\
	co = checkout\n\
	br = branch\n\
	df = diff\n\
	rt = remote -v\n\
	last = log -2 HEAD\n\
	tree = log --oneline --decorate --all --graph\n\
[color]\n\
	branch = auto\n\
	diff = auto\n\
	interactive = auto\n\
	status = auto'>> /root/.gitconfig && \
    echo 'set background=dark\n\
syntax on \n\
set nocompatible \n\
set backspace=indent,eol,start \n\
set expandtab shiftwidth=4 tabstop=4 softtabstop=4 \n\
set cindent \n\
set smartindent \n\
set selectmode=mouse \n\
set nobackup \n\
set nowritebackup \n\
set noswapfile \n\
set history=200 \n\
set ruler \n\
set number \n\
set showcmd \n\
set incsearch \n\
set hlsearch \n\
set ignorecase \n\
set showmatch \n\
set laststatus=2 \n\
set tabpagemax=30\n\
map <Right> <Esc>:tabn<CR>\n\
map <Left> <Esc>:tabp<CR>' >> /root/.vimrc

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
