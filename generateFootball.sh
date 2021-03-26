MODULE_SRC=Modules/FootballNetworking/Sources/FootballNetworking
openapi-generator generate -i football.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
