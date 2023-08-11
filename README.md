# Desafio - DevOps Pleno

## 1. Criar um Dockerfile para a aplicação
 
 - A aplicação é o `app.py`. O Docker tem que expor a porta `9555`. Queremos rodar o container, acessar via broswer `http://localhost:9555` e receber a mensagem `Hello World - Python!`.
- Criar um health check no Docker para a aplicação na rota /healthz.


## 2. Criar terraform para realizar deploy de recursos na Azure

- Recursos necessários: 1x App Service, 1x Storage Account, 1x Container Registry;
- Utilizar os SKUs mais básicos (free tier);
- Adicione um identificador com seu nome e sobrenome para todos os recursos Azure criados. Ex: 'CRIADO-POR: JOAO SILVA';
- O Terraform além de provisionar os recursos Azure, na sua primeira execução (e somente na primeira) deve fazer o build da imagem Docker (do passo 1) e enviar para o container registry;
- O App Service deve utilizar a imagem que subiu com o terraform (e que está no Container Registry) como 'primeiro deploy';
- Após a finalização do terraform queremos entrar no endereço do App Service e ver o mesmo `Hello World - Python!` do passo 1;
- **IMPORTANTE:** Só queremos os arquivos terraform. Não é necessário criar os recursos em uma subscription sua.


## 3. Pipeline CI/CD escrita em YAML (opcional)

- Criar uma pipeline que atualiza o código da aplicação, faça o build da imagem Docker, faça um push para o container registry (com uma nova tag) e atualize a mesma no App Service (sem usar Terraform);
- A pipeline pode ser escrita utilizando (preferencialmente) a sintaxe do Azure DevOps ou do GitHub.
