# ChatGPT-API Demo

Un repositorio de demostración basado en [OpenAI GPT-3.5 Turbo API.](https://platform.openai.com/docs/guides/chat)

**🍿 Vista previa**: https://chat-gpt-demon.vercel.app

> ⚠️ Aviso: nuestro límite de clave API se ha agotado. Por lo tanto, el sitio de demostración no está disponible ahora.

![chat-logo](https://i.ibb.co/ZxZNJfM/Chat-Gpt-Demon.jpg)

## Ejecución local

### Pre ambiente
1. **Node**: Verifique que tanto su entorno de desarrollo como su entorno de implementación estén utilizando `Node v18` o después. Puedes usar [nvm](https://github.com/nvm-sh/nvm) para administrar múltiples `node` versiones localmente。
   ```bash
    node -v
   ```
2. **PNPM**: Recomendamos usar [pnpm](https://pnpm.io/) para administrar las dependencias. Si nunca ha instalado pnpm, puede instalarlo con el siguiente comando:
   ```bash
    npm i -g pnpm
   ```
3. **OPENAI_API_KEY**: Antes de ejecutar esta aplicación, debe obtener la clave API de OpenAI. Puede registrar la clave API en [https://beta.openai.com/signup](https://beta.openai.com/signup).

### Empezando

1. Instalar dependencias
   ```bash
    pnpm install
   ```
2. Copia el `.env.example` archivo, luego cámbiele el nombre a `.env`, y agrega tu [OpenAI API key](https://platform.openai.com/account/api-keys) hacia el `.env` archivo.
   ```bash
    OPENAI_API_KEY=sk-xxx...
   ```
3. Ejecute la aplicación, el proyecto local se ejecuta en `http://localhost:3000/`
   ```bash
    pnpm run dev
   ```

## Desplegar

### Implementar con Vercel

[![Implementar con Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FElChema-Nc%2FChatGpt-Demon&env=OPENAI_API_KEY&envDescription=OpenAI%20API%20Key&envLink=https%3A%2F%2Fplatform.openai.com%2Faccount%2Fapi-keys)



> #### 🔒 ¿Necesita la contraseña del sitio web?
>
> Implementar con el [`SITE_PASSWORD`](#environment-variables)
>
> <a href="https://vercel.com/new/clone?repository-url=https%3A%2F%2Fgithub.com%2FElChema-Nc%2FChatGpt-Demon&env=OPENAI_API_KEY&env=SITE_PASSWORD&envDescription=OpenAI%20API%20Key&envLink=https%3A%2F%2Fplatform.openai.com%2Faccount%2Fapi-keys" alt="Deploy with Vercel" target="_blank"><img src="https://vercel.com/button" alt="Deploy with Vercel" height=24 style="vertical-align: middle; margin-right: 4px;"></a>

![image](https://i.ibb.co/LzcCLgj/Clonar-Chat-Gpt-Demon.jpg)


### Implementar con Netlify

[![Implementar con Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/ElChema-Nc/ChatGpt-Demon#OPENAI_API_KEY=&HTTPS_PROXY=&OPENAI_API_BASE_URL=&HEAD_SCRIPTS=&PUBLIC_SECRET_KEY=&OPENAI_API_MODEL=&SITE_PASSWORD=)

**Tutorial de implementación paso a paso:**

1. [Fork](https://github.com/ElChema-Nc/ChatGpt-Demon/fork) este proyecto, Ir a [https://app.netlify.com/start](https://app.netlify.com/start) nuevo sitio, seleccione el proyecto que `forked` Listo y conéctelo con su cuenta de `GitHub`.


### Implementar con Docker

Las variables de entorno se refieren a la documentación a continuación. [Dirección de Docker Hub](https://hub.docker.com/r/ElChema-Nc/ChatGpt-Demon).

**Ejecución directa**
```bash
docker run --name=Chatdemon -e OPENAI_API_KEY=YOUR_OPEN_API_KEY -p 3000:3000 -d elchema-nc/chatdemon:latest
```
`-e` definir variables de entorno en el contenedor.


**Componer ventana acoplable**
```yml
version: '3'

services:
  chatgpt-demon:
    image: elchema-nc/chatgpt-demon:latest
    container_name: chatgpt-demon
    restart: always
    ports:
      - '3000:3000'
    environment:
      - OPENAI_API_KEY=YOUR_OPEN_API_KEY
      # - HTTPS_PROXY=YOUR_HTTPS_PROXY
      # - OPENAI_API_BASE_URL=YOUR_OPENAI_API_BASE_URL
      # - HEAD_SCRIPTS=YOUR_HEAD_SCRIPTS
      # - PUBLIC_SECRET_KEY=YOUR_SECRET_KEY
      # - SITE_PASSWORD=YOUR_SITE_PASSWORD
      # - OPENAI_API_MODEL=YOUR_OPENAI_API_MODEL
```

```bash
# start
docker compose up -d
# down
docker-compose down
```

### Implementar en más servidores

Consulte la documentación oficial de implementación.：https://docs.astro.build/en/guides/deploy

## Variables de entorno

Puede controlar el sitio web a través de variables de entorno.

| Nombre | Descripción | Default |
| --- | --- | --- |
| `OPENAI_API_KEY` | Su clave API para OpenAI. | `null` |
| `HTTPS_PROXY` | Proporcionar proxy para la API de OpenAI. e.g. `http://127.0.0.1:7890` | `null` |
| `OPENAI_API_BASE_URL` | URL base personalizada para la API de OpenAI. | `https://api.openai.com` |
| `HEAD_SCRIPTS` | Inyectar análisis u otros scripts antes `</head>` de la pagina | `null` |
| `PUBLIC_SECRET_KEY` | Cadena secreta para el proyecto. Uso para generar firmas para llamadas API | `null` |
| `SITE_PASSWORD` | Establezca una contraseña para el sitio, admita varias contraseñas separadas por comas. Si no se establece, el sitio será público | `null` |
| `OPENAI_API_MODEL` | ID del modelo a utilizar. [Lista de modelos](https://platform.openai.com/docs/api-reference/models/list) | `gpt-3.5-turbo` |


## Preguntas frecuentes

Q: TypeError: búsqueda fallida (no se puede conectar a OpenAI Api)

A: Configurar variables de entorno `HTTPS_PROXY`，referencia: https://github.com/ElChema-Nc/ChatGpt-Demon/issues

Q: lanzar un nuevo TypeError(${context} no es un ReadableStream.)

A: La versión del nodo debe ser `v18` o posterior, referencia: https://github.com/ElChema-Nc/ChatGpt-Demon/issues

Q: ¿Acelerar el acceso doméstico sin la necesidad de un tutorial de implementación de proxy?

A: Puedes consultar este tutorial: https://github.com/ElChema-Nc/ChatGpt-Demon/discussions

Q: `PWA` no está trabajando?

A: Actual `PWA` no admite la implementación en Netlify, puede elegir la implementación de vercel o nodo.

## License

MIT © [ElChema-Nc](https://github.com/ElChema-Nc/ChatGpt-Demon/blob/main/LICENSE)
