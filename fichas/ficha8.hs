module Ficha8 where

-- exercicio 2
{-
Relembre o tipo definido na Ficha 7 para representar express˜oes inteiras. Uma poss´ıvel
generaliza¸c˜ao desse tipo de dados, ser´a considerar express˜oes cujas constantes s˜ao de
um qualquer tipo num´erico (i.e., da classe Num).
-}

data Exp a = Const a
           | Simetrico (Exp a)
           | Mais (Exp a) (Exp a)
           | Menos (Exp a) (Exp a)
           | Mult (Exp a) (Exp a)

-- (a) Declare Exp a como uma instˆancia de Show.
a

-- (b) Declare Exp a como uma instˆancia de Eq.


-- (c) Declare Exp a como instˆancia da classe Num.