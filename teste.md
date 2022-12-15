Nessa etapa do processo seletivo vamos precisar que você crie uma API para gerenciar as mensalidades dos alunos. Bora lá?

## Requisitos da API

- O projeto deve ser construído usando alguma das seguintes linguagens `Ruby`, `Elixir` ou `NodeJS`. Podendo utilizar o framework que você preferir (Ex: Ruby on Rails, Phoenix, NestJS, etc).
- Os modelos devem ser respeitados e todos os campos, validações e restrições devem existir. Fique a vontade para adicionar novos campos ou validações se necessário.
- Os dados da API devem ser salvos em um banco de dados `PostgreSQL`.
- Todas as rotas da API devem receber e responder no formato `JSON`.
- Seu projeto deve ter pelo menos as rotas descritas abaixo. Fique a vontade para adicionar novas rotas e funcionalidades, mas tenha cuidado em sempre manter a consistência dos dados no banco.

## Modelos

Os modelos que vamos precisar nessa API são os seguintes:

- Student (Aluno)
  - name: Nome do aluno
  - cpf: CPF do aluno
  - bithdate: Data de nascimento do aluno
  - payment_method: Meio de pagamento do aluno (cartão de crédito ou boleto)
- Enrollment (Matrícula)
  - amount: Valor total em centavos da matrícula
  - installments: Quantidade de mensalidades da matrícula
  - due_day: Dia de vencimento da matrícula
- Bill (Mensalidade)
  - amount: Valor da mensalidade em centavos
  - due_date: Data de vencimento da mensalidade
  - status: Status da mensalidade (Aberta, atrasada ou paga)

Onde um aluno pode ter várias matrículas e uma matrícula tem várias mensalidades.

## Validações dos modelos

### Student

| Campo          | Tipo   | Validações                                                                   |
| -------------- | ------ | ---------------------------------------------------------------------------- |
| name           | string | Não pode estar vazio                                                         |
| cpf            | string | Tem que ser um CPF válido e deve ser único                                   |
| birthdate      | date   | Tem que ser uma data válida se presente, deve aceitar ser vazio              |
| payment_method | string | Tem que ser um dos seguintes: `credit_card` ou `boleto` e não pode ser vazio |

### Enrollment

| Campo        | Tipo    | Validações                                                   |
| ------------ | ------- | ------------------------------------------------------------ |
| amount       | integer | Não pode estar vazio e tem que ser maior que 0               |
| installments | integer | Não pode estar vazio e tem que ser maior que 1               |
| due_day      | integer | Não pode estar vazio e tem que ser um dia válido (de 1 a 31) |

### Bill

| Campo    | Tipo    | Validações                                                                                                      |
| -------- | ------- | --------------------------------------------------------------------------------------------------------------- |
| amount   | integer | Não pode estar vazio e tem que ser maior que 0                                                                  |
| due_date | date    | Não pode estar vazio e tem que ser uma data valida                                                              |
| status   | string  | Tem que ser um dos seguintes: `open`, `pending` ou `paid`, sendo o valor default: `open` e não pode estar vazio |

## Restrições

- A soma de todas as bills devem ser igual ao valor da enrollment:

```ruby
  enrollment.amount == enrollment.bills.sum('amount') # true
```

- A soma da quantidade de bills deve ser igual ao valor do campo `installments` da enrollment:

```ruby
  enrollment.installments == enrollment.bills.count # true
```

## Rotas

### Listagem de Alunos

Essa rota deve retornar uma lista paginada de alunos com os dados formatados e recebendo como parâmetro o número da página e o total de itens por página:

#### Request

```
GET /students
```

```json
{
  "page": 1,
  "count": 3
}
```

#### Response

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "name": "Aluno teste",
      "cpf": "502.757.480-06",
      "birthdate": "23/10/2000",
      "payment_method": "Cartão de crédito"
    },
    {...},
    {...}
  ]
}
```

### Criação de Alunos

Essa rota deve retornar o id do aluno criado:

#### Request

```
POST /students
```

```json
{
  "name": "Novo aluno",
  "cpf": "038.347.910-08",
  "birthdate": "23/10/1996",
  "payment_method": "boleto"
}
```

#### Response

```json
{
  "id": 2
}
```

### Listagem de Matrículas

Essa rota deve retornar uma lista paginada de matrículas e todas as mensalidades de cada matrícula, recebendo como parâmetro o número da página e o total de itens por página:

#### Request

```
GET /enrollments
```

```json
{
  "page": 1,
  "count": 3
}
```

#### Response

```json
{
  "page": 1,
  "items": [
    {
      "id": 1,
      "student_id": 1,
      "amount": 1200000,
      "installments": 3,
      "due_day": 5,
      "bills": [
        {
          "id": 1,
          "due_date": "05/03/2021",
          "status": "open",
          "amount": 400000
        }
        {
          "id": 2,
          "due_date": "05/04/2021",
          "status": "open",
          "amount": 400000
        },
        {
          "id": 3,
          "due_date": "05/05/2021",
          "status": "open",
          "amount": 400000
        }
      ]
    },
    {...},
    {...}
  ]
}
```

### Criação de Matrículas

Ao criar a matrícula, suas mensalidades devem ser geradas automáticamente, seguindo as seguintes regras:

- A quantidade de mensalidades devem ser iguais ao campo `installments` da matrícula
- O valor de cada mensalidade (`amount`) deve ser calculado a partir do valor da matrícula (`amount`) dividido pela quantidade de `installments` da matrícula
- A data de vencimento das mensalidades devem ser subsequentes a data atual, sempre havendo uma e apenas uma mensalidade para cada mês
  - Caso o dia de vencimento da matrícula seja um dia menor que o dia atual a primeira mensalidade deve começar no mês seguinte, caso seja maior ou igual deve começar no mês atual
- Por essa rota ser uma rota crítica para a API, precisamos que tenha uma autenticação basic nela, com o usuário: `admin_ops` e a senha `billing`

A rota deve retornar a matricula e suas mensalidades. Aqui vamos deixar dois exemplos, o primeiro com a data atual sendo `01/03/2021` e o segundo sendo `10/03/2021`.

#### Request (dia atual 01/03/2021)

```
POST /enrollments
```

```json
{
  "amount": 1200000,
  "installments": 3,
  "due_day": 5,
  "student_id": 1
}
```

#### Response (dia atual 01/03/2021)

```json
{
  "id": 1,
  "student_id": 1,
  "amount": 1200000,
  "installments": 3,
  "due_day": 5,
  "bills": [
    {
      "id": 1,
      "due_date": "05/03/2021",
      "status": "open",
      "amount": 400000
    }
    {
      "id": 2,
      "due_date": "05/04/2021",
      "status": "open",
      "amount": 400000
    },
    {
      "id": 3,
      "due_date": "05/05/2021",
      "status": "open",
      "amount": 400000
    }
  ]
}
```

#### Request (dia atual 10/03/2021)

```
POST /enrollments
```

```json
{
  "amount": 1200000,
  "installments": 3,
  "due_day": 5,
  "student_id": 1
}
```

#### Response (dia atual 10/03/2021)

```json
{
  "id": 1,
  "student_id": 1,
  "amount": 1200000,
  "installments": 3,
  "due_day": 5,
  "bills": [
    {
      "id": 1,
      "due_date": "05/04/2021",
      "status": "open",
      "amount": 400000
    }
    {
      "id": 2,
      "due_date": "05/05/2021",
      "status": "open",
      "amount": 400000
    },
    {
      "id": 3,
      "due_date": "05/06/2021",
      "status": "open",
      "amount": 400000
    }
  ]
}
```

## Considerações finais

- Este é um teste de back-end! Não é necessário fazer telas, caso você seja um front e te enviaram esse teste, avise sua recrutadora!
- Desenvolva seu projeto utilizando um repositório do GitHub e nos envie o link do repo ao finalizar o desafio
- Demonstre da maneira que achar adequado que a aplicação funciona como especificado
