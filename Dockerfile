#docker build -t agiboo.azurecr.io/dotnet/aspnet:6.0.9 .
ARG REPO=mcr.microsoft.com/dotnet/aspnet
FROM $REPO:6.0.9

Run apt-get update && \
    apt-get --only-upgrade install libssl1.1 libgssapi-krb5-2 openssl libgnutls30 libtasn1-6 libk5crypto3 coreutils -y 


WORKDIR /app	
 
# create a new user and change directory ownership
RUN adduser --disabled-password \
  --home /app \
  --gecos '' dotnetuser && chown -R dotnetuser /app

# impersonate into the new user
USER dotnetuser
