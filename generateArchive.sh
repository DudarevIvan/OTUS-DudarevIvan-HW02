MODULE_SRC=Modules/FootballArchiveNetworking/Sources/FootballArchiveNetworking
openapi-generator generate -i footballArchive.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
