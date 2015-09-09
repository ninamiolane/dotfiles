# -- systemwide .profile
test -f /etc/profile && source /etc/profile

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

if [[ -f ${HOME}/.bash_completion && -d ${HOME}/.bash_completion.d ]]; then
    . ${HOME}/.bash_completion
fi
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export VISUAL=${EDITOR}
export PATH=$PATH:/usr/local/cuda/bin
export PYTHONPATH=$PYTHONPATH:/usr/local/caffe/python
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/caffe/lib/
export LD_LIBRARY_PATH=/usr/local/cuda/lib64
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(parse_git_branch)\$\[\033[00m\] '
