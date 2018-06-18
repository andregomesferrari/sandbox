

# get azure_rm.py from the github:
wget https://github.com/ansible/ansible/raw/devel/contrib/inventory/azure_rm.py
wget https://github.com/ansible/ansible/raw/devel/contrib/inventory/azure_rm.ini

#set the environment variables with the Azure RM service pricipal credentials
export AZURE_CLIENT_ID=""
export AZURE_SECRET=""
export AZURE_SUBSCRIPTION_ID=""
export AZURE_TENANT=""

