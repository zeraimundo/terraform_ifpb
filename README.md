# Provisionamento de Instância e Serviço HTTP na AWS com Terraform

![Terraform](https://img.shields.io/badge/Terraform-v1.0.7-blue?logo=terraform)
![AWS](https://img.shields.io/badge/AWS-EC2-orange?logo=amazon-aws)
![GitHub](https://img.shields.io/badge/GitHub-zeraimundo-lightgrey?logo=github)

Este repositório contém um exemplo de como provisionar uma instância EC2 e um serviço HTTP na AWS usando Terraform. 

O Terraform é uma ferramenta de código aberto para provisionamento de infraestrutura como código. Com o Terraform, é possível descrever a infraestrutura de uma aplicação como um código em arquivos .tf, permitindo a criação, atualização e destruição de recursos de forma automatizada e previsível.

## Pré-requisitos

Antes de começar, você precisa ter uma conta na AWS e instalar o Terraform na sua máquina. Você também precisa ter credenciais da AWS configuradas no seu ambiente. Se você ainda não tem uma conta na AWS, pode criar uma [aqui](https://aws.amazon.com/pt/free/).

Para instalar o Terraform, siga as instruções da [documentação oficial](https://learn.hashicorp.com/tutorials/terraform/install-cli).

## Como usar

Clone este repositório:

```bash
git clone https://github.com/zeraimundo/terraform_virt.git
```

Entre no diretório do projeto:

```bash
cd terraform_virt
```

Inicialize o Terraform:

```bash
terraform init
```

Edite o arquivo vars.tf com suas credenciais da AWS:

```bash
access_key = "SUA_ACCESS_KEY"
secret_key = "SUA_SECRET_KEY"
```

Substitua SUA_ACCESS_KEY, SUA_SECRET_KEY pelas suas informações.

Agora, você pode criar a infraestrutura:

```bash
terraform apply
```

Aguarde até que o Terraform crie a instância EC2 e o serviço HTTP na AWS. Depois, você pode acessar o serviço HTTP usando o IP público da instância EC2.

Quando você terminar de usar a infraestrutura, pode destruí-la usando o comando:

```bash
terraform destroy
```

## Cotribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.
