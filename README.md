# Cálculadora de IMC [API] - Ruby on Rails

> Aplicação desenvolvida durante o Desafio Back-end Ruby On Rails, uma API que permite o cálculo do IMC do paciente.

## 💻 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:
<!---Estes são apenas requisitos de exemplo. Adicionar, duplicar ou remover conforme necessário--->
* Você instalou a versão  ` Ruby '3.1.2' | Rails '7.0.4'`.  

## 🚀 Instalando <imc_api>

Para instalar o <imc_api>, siga estas etapas:

Clone este repositório:
```
git clone git@github.com:femanix/imc.git
```

Instale as Gems:
```
bundle install
```

A aplicação está pronta para uso:
```
rails s
```
## 🔐 Token <imc_api>

Gere o Token de Autenticação:
```
"POST /auth"

{
  'username': "SEU_NOME_DE_USUÁRIO"
}

# Você receberá seu token no seguinte formato:
{
  "token": "eyJhbGciOiJIUzI1NiJ9"
}

# O token é gerado utilizando a biblioteca JWT.
```

O token deverá ser enviado nos headers da requisição:
```
headers{
  "Content-Type":"application/json",
  "Authorization": "eyJhbGciOiJIUzI1NiJ9""
}
```
## 📊 IMC  <imc_api>
Para cálcular o IMC:
```
POST /imc

{
  "height": 1.70,
  "weight": 75
}
```
Retorno:
```
Response /imc - 200 OK

{
  "imc": 26.3,
  "classification": "Sobrepeso",
  "obesity": "I" 
}
```
Testes:
```
$ bundle exec rspec
```