# 🕵️‍♀️ SQL Mystery – O Caso do Manuscrito Perdido

Um valioso e raro manuscrito desapareceu da Biblioteca Central durante uma noite chuvosa.  
Sabe-se que apenas pessoas com **acesso autorizado** puderam entrar no acervo naquela noite.  
A investigação depende da análise de registros: livros emprestados, pessoas presentes, autores convidados e leitores cadastrados.

**Você consegue descobrir quem pegou o manuscrito?**

> 💡 Exercício criado por Leticia Pires no Bootcamp de Engenharia de Dados da comunidade [Data Girls](https://www.instagram.com/datagirls.community/)

---

## 🎯 Objetivo

- Criar a estrutura relacional de uma biblioteca (DDL)
- Popular tabelas com dados fictícios (DML)
- Realizar consultas investigativas usando SQL puro (DQL)
- Exercitar raciocínio lógico e análise de dados em formato de jogo/enigma

---

## 🗃️ Estrutura do Banco

O banco contém as seguintes tabelas:

- `autores` — autores disponíveis na biblioteca
- `livros` — catálogo de livros e seus estoques
- `leitores` — pessoas autorizadas ou não a pegar livros
- `funcionarios` — equipe presente no local
- `emprestimos` — registros de empréstimos com data
- `convidados_evento` — autores presentes na noite do evento

---

## 🧩 Consultas realizadas

- Quem estava autorizado a entrar?
- Quais livros foram emprestados na data do desaparecimento?
- Quem pegou o livro raro (estoque = 1)?
- Cruzamento entre leitores autorizados, livros emprestados e data do evento

---

## 🚀 Como executar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seuusuario/SQL-Mystery-O-Caso-do-Manuscrito-Perdido.git
   cd SQL-Mystery-O-Caso-do-Manuscrito-Perdido
