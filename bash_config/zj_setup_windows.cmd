REM generate ssh key pair
ssh-keygen -t rsa


REM This command is used to copy the public key.
scp -P 5022 C:\Users\13193\.ssh\id_rsa_gpuserver-05.pub zhangjun@114.212.191.75:~/.ssh


echo "Remember to add the path of the private key to your SSH configuration file."
echo "Remember to copy and add the public key to the authorized_keys file on the server."
