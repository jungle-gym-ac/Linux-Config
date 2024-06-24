



#################zj's bashrc config####################

# some more ls aliases
alias ll='ls -alF' # ls with all information
alias la='ls -A' #ls with hidden files
alias l='ls -CF' # ls without hidden files

# Conda command shortcuts
alias act="conda activate"
alias envl="conda env list"

#gpu monitor
alias gpu="watch -d -n 0.5 nvidia-smi"

# source .bashrc, frequently used in tmux
alias src="source ~/.bashrc"

# project
alias project="cd /home/zhangjun/project && act project"


# hugging face mirror, see https://hf-mirror.com/
export HF_ENDPOINT=https://hf-mirror.com
export HF_HOME=/home/zhangjun/data/huggingface

#################zj's bashrc config (END)####################



