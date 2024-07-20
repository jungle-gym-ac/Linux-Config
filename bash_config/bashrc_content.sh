



#################zj's bashrc config####################

# some more ls aliases
alias ll='ls -alF' # ls with all information
alias la='ls -A' #ls with hidden files
alias l='ls -CF' # ls without hidden files

# Conda command shortcuts
alias act="conda activate"
alias envl="conda env list"

#gpu monitor
alias nv="watch -d -n 0.5 nvidia-smi"
alias gpu="gpustat -i"

# source .bashrc, frequently used in tmux
alias src="source ~/.bashrc"

# project
alias project="cd /home/zhangjun/project && act project"


# hugging face mirror, see https://hf-mirror.com/
export HF_ENDPOINT=https://hf-mirror.com
#export HF_HOME=~/.cache/huggingface/hub

#.cache can been soft-linked
#mv .cache /data1/zhangjun/.cache
#ln -s /disk/zdata0/home/zhangjun/.cache .cache

#################zj's bashrc config (END)####################



