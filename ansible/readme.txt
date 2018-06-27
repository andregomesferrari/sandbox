

# get azure_rm.py from the github:
wget https://github.com/ansible/ansible/raw/devel/contrib/inventory/azure_rm.py
wget https://github.com/ansible/ansible/raw/devel/contrib/inventory/azure_rm.ini

#set the environment variables with the Azure RM service pricipal credentials
export AZURE_CLIENT_ID=""
export AZURE_SECRET=""
export AZURE_SUBSCRIPTION_ID=""
export AZURE_TENANT=""

export AZURE_USE_PRIVATE_IP=1

# create a shared credential on the control box 
ssh-keygen

save it to azure in a key vault



jq '._meta|.hostvars|.[]|.private_ip' test.json

ssh-keyscan -H $IP >> ~/.ssh/known_hosts

for server in ${servers[@]}; do
 echo ${server}
 ssh user@${server} "for i in /tmp/foo* ; do echo ${i}; done"
done

for IP in $(jq -r '[._meta|.hostvars|.[]|.private_ip]|@tsv' test.json)
do
    ssh-keyscan -H $IP >> ~/.ssh/known_hosts
   echo $IP "added to known_hosts"
done

 for IP in $(jq -r '[._meta|.hostvars|.[]|.private_ip]|@tsv' test.json); 
 do 
    ssh-keyscan -H $IP; 
 done