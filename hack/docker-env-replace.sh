#!/bin/sh

# Su clave API para OpenAI
openai_api_key=$OPENAI_API_KEY
# Proporcione un proxy para la API de OpenAI. e.g. http://127.0.0.1:7890
https_proxy=$HTTPS_PROXY
# URL base personalizada para la API de OpenAI. por defecto: https://api.openai.com
openai_api_base_url=$OPENAI_API_BASE_URL
# Inyectar análisis u otras secuencias de comandos antes de </head> de la página
head_scripts=$HEAD_SCRIPTS
# Cadena secreta para el proyecto. Uso para generar firmas para llamadas API
public_secret_key=$PUBLIC_SECRET_KEY
# Establezca una contraseña para el sitio, admita varias contraseñas separadas por comas. Si no se establece, el sitio será público
site_password=$SITE_PASSWORD
# ID del modelo a utilizar. https://platform.openai.com/docs/api-reference/models/list
openai_api_model=$OPENAI_API_MODEL

for file in $(find ./dist -type f -name "*.mjs"); do
  sed "s/({}).OPENAI_API_KEY/\"$openai_api_key\"/g;
  s/({}).HTTPS_PROXY/\"$https_proxy\"/g;
  s/({}).OPENAI_API_BASE_URL/\"$openai_api_base_url\"/g;
  s/({}).HEAD_SCRIPTS/\"$head_scripts\"/g;
  s/({}).PUBLIC_SECRET_KEY/\"$public_secret_key\"/g;
  s/({}).OPENAI_API_MODEL/\"$openai_api_model\"/g;
  s/process.env.SITE_PASSWORD/\"$site_password\"/g" $file > tmp
  mv tmp $file
done

rm -rf tmp
