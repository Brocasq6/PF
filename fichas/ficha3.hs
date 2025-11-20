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
agendaExemplo = [ ("Ana",  [Casa 123456789, Email "ana@ex.com"])
             , ("João", [Tlm 912345678, Trab 234567890])
             , ("Maria",[Email "maria@ex.com", Email "maria.work@ex.com"])
             , ("Luís", [Casa 22334455])
             , ("Novo", [])
             ]
--(a) Defina a fun¸c˜ao acrescEmail :: Nome -> String -> Agenda -> Agenda que,
--dado um nome, um email e uma agenda, acrescenta essa informa¸c˜ao `a agenda.

-- ...existing code...
acresEmail :: Nome -> String -> Agenda -> Agenda 
acresEmail nome email [] = [(nome, [Email email])]
acresEmail nome email ((n, cs):t)
    | nome == n = ((n, Email email : cs) : t)
    | otherwise = (n, cs) : acresEmail nome email t

--(b) Defina a fun¸c˜ao verEmails :: Nome -> Agenda -> Maybe [String] que, dado
--um nome e uma agenda, retorna a lista dos emails associados a esse nome. Se esse
--nome n˜ao existir na agenda a fun¸c˜ao deve retornar Nothing.

verEmails :: Nome -> Agenda -> Maybe [String]
verEmails nome [] = Nothing 
verEmails nome ((n,cs):t) 
    | nome == n = Just [e | Email e <- cs]
    | otherwise = verEmails nome t

email :: Contacto -> Bool
email (Email _) = True
email _ = False

--(c) Defina a fun¸c˜ao consTelefs :: [Contacto] -> [Integer] que, dada uma lista
--de contactos, retorna a lista de todos os n´umeros de telefone dessa lista (tanto
--telefones fixos como telem´oveis).

consTelef :: [Contacto] -> [Integer]
consTelef [] = []
consTelef (Casa n:t) = n : consTelef t 
consTelef (Tlm n:t) = n : consTelef t
consTelef (h:t) = consTelef t


--(d) Defina a fun¸c˜ao casa :: Nome -> Agenda -> Maybe Integer que, dado um nome
--e uma agenda, retorna o n´umero de telefone de casa (caso exista)

casa :: Nome -> Agenda -> Maybe Integer
casa nome [] = Nothing
casa nome ((n,cs):t)
    | nome == n = case [x | Casa x <- cs] of
                    (n : _) -> Just n
                    []      -> Nothing
    | otherwise = casa nome t

agenda1 = [("João", [Casa 123456, Email "joao@ex.com"]), 
           ("Maria", [Tlm 987654, Trab 111222])]

