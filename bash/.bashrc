# -- systemwide .profile
function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi
if [[ -f ${HOME}/.bash_completion && -d ${HOME}/.bash_completion.d ]]; then
    . ${HOME}/.bash_completion
fi

platform=$(uname)

# Some colors on linux
if [[ $platform == 'Linux' ]]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias ll='ls -l --color=auto'
fi

export CLICOLOR=1
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/caffe/lib/
export EDITOR=/usr/bin/vim
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
export PATH=$PATH:/usr/local/arcanist/arcanist/bin
export PATH=$PATH:/usr/local/cuda/bin
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(parse_git_branch)\$\[\033[00m\] '
export PYTHONPATH=$PYTHONPATH:/usr/local/caffe/python
export VISUAL=${EDITOR}
