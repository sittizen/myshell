curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
apt-get update 
ACCEPT_EULA=Y apt-get install mssql-tools unixodbc-dev
