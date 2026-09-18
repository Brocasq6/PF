module Ficha3 where
-- Exercicio 3

data Contacto = Casa Integer
    | Trab Integer
    | Tlm Integer
    | Email String
    deriving Show

type Nome = String
type Agenda = [(Nome, [Contacto])]

agendaExemplo :: Agenda

--(a) Defina a fun¸c˜ao acrescEmail :: Nome -> String -> Agenda -> Agenda que,
--dado um nome, um email e uma agenda, acrescenta essa informa¸c˜ao `a agenda.

-- ...existing code...
acresEmail :: Nome -> String -> Agenda -> Agenda 


--(b) Defina a fun¸c˜ao verEmails :: Nome -> Agenda -> Maybe [String] que, dado
--um nome e uma agenda, retorna a lista dos emails associados a esse nome. Se esse
--nome n˜ao existir na agenda a fun¸c˜ao deve retornar Nothing.

verEmails :: Nome -> Agenda -> Maybe [String]


email :: Contacto -> Bool


--(c) Defina a fun¸c˜ao consTelefs :: [Contacto] -> [Integer] que, dada uma lista
--de contactos, retorna a lista de todos os n´umeros de telefone dessa lista (tanto
--telefones fixos como telem´oveis).

consTelef :: [Contacto] -> [Integer]



--(d) Defina a fun¸c˜ao casa :: Nome -> Agenda -> Maybe Integer que, dado um nome
--e uma agenda, retorna o n´umero de telefone de casa (caso exista)

casa :: Nome -> Agenda -> Maybe Integer
