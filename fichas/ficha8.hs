module Ficha8 where


data Frac = F Interger Interger

{-
(a) Defina a função normaliza :: Frac -> Frac, que dada uma fracção calcula uma
fracção equivalente, irredutı́vel, e com o denominador positivo. Por exemplo,
normaliza (F (-33) (-51)) deve retornar F 11 17 e normaliza (F 50 (-5))
deve retornar F (-10) 1. Sugere-se que comece por definir primeiro a função
mdc :: Integer -> Integer -> Integer que calcula o máximo divisor comum
entre dois números, baseada na seguinte propriedade (atribuida a Euclides):
mdc x y == mdc (x+y) y == mdc x (y+x)
-}

-- (b) Defina Frac como instância da classe Eq.


-- (c) Defina Frac como instância da classe Ord.


{-
(d) Defina Frac como instância da classe Show, de forma a que cada fracção seja
apresentada por (numerador/denominador).
-}

{-
(e) Defina Frac como instância da classe Num. Relembre que a classe Num tem a
seguinte definição
class (Eq a, Show a) => Num a where
(+), (*), (-) :: a -> a -> a
negate, abs, signum :: a -> a
fromInteger :: Integer -> a
-}

{-
(f) Defina uma função que, dada uma fracção f e uma lista de fracções l, selecciona
de l os elementos que são maiores do que o dobro de f.
-}

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