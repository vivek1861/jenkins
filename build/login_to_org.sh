echo "Logging into Salesforce Org"
mkdir keys
echo $CERT_KEY | base64 -di > keys/server.key

echo "Authenticating org"
sfdx force:auth:jwt:grant --client-id $APP_KEY --jwt-key-file keys/jwtprivate.key --username $SF_USERNAME --set-default-dev-hub -a DevHub