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

showExp :: Show a => Exp a -> String
showExp (Const a )      = show a
showExp (Simetrico a)   = "-" ++ (showExp a)
showExp (Mais a b)      = "(" ++ (showExp a) ++ "+" ++ (showExp b) ++ ")"
showExp (Menos a b)     = "(" ++ (showExp a) ++ "-" ++ (showExp b) ++ ")"
showExp (Mult a b)      = "(" ++ (showExp a) ++ "*" ++ (showExp b) ++ ")"

instance show a => snow(Exp a) where
    show = showExp

calcula :: Num a => Exp a -> a 
calcula (Const a)        = a
calcula (Simetrico a)    = - (calcula a)
calcula (Mais a b)       = calcula a + calcula b    
calcula (Menos a b)      = calcula a - calcula b
calcula (Mult a b)       = calcula a * calcula b    



-- (b) Declare Exp a como uma instˆancia de Eq.

eqExp :: Eq a => Exp a -> Exp a -> Bool
eqExp (Const a) (Const b)             = calcula a == calcula b

-- (c) Declare Exp a como instˆancia da classe Num.