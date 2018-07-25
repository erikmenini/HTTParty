# HTTParty

##Configurando a API

Instalar o node e o json server via npm:

```ruby

Mac:

brew install npm

npm install -g json-server
```

Acesse a pasta fakeapi e depois execute o servidor conforme abaixo

```ruby
json-server --watch endpoints.json

O resultado será esse:

\{^_^}/ hi!

Loading db.json
Done

Resources
http://localhost:3000/clients

Home
http://localhost:3000

Type s + enter at any time to create a snapshot of the database
Watching...
```

Abrir o navegador e ver se o endpoint ta funcionando colocando 'http://localhost:3000/clients' e o resultado será assim:

```ruby
{
  "id": 1,
  "nome": "Nome Teste",
  "cpf": "123.456.789-0",
  "endereco": "Rua Teste dos teste",
}
```

##Sobre o projeto

Para executar o mesmo acesse a pasta que está o projeto, e com a máquina configurada com o bundler, execute:
```ruby

Mac:

bundle install
```
Execute os testes com o cucumber e seja feliz :D