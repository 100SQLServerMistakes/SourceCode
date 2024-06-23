sudo docker run -e "ACCEPT_EULA=Y" \
-e "MSSQL_SA_PASSWORD=Pa$$w0rd" \
-p 1433:1433 \
--name production \
--hostname production \
-v sqldata:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:2022-latest
