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

normaliza :: Frac -> Frac
normaliza (F a b)
    | b < 0 = normaliza $ F (-a) (-b)
    | otherwise = 
        let d = mdc a b in
        F (a `div` d) (b `div` d)

mdc :: Integer -> Integer -> Integer
mdc x 0 = x
mdc 0 y = y
mdc x y = mdc y (x `mod` y)

-- (b) Defina Frac como instância da classe Eq.

instance Eq Frac where
    (==) :: Frac -> Frac -> Bool
    f1 == f2 = a1 == a2 && b1 == b2
        where   F a1 b1 = normaliza f1
                F a2 b2 = normaliza f2

-- (c) Defina Frac como instância da classe Ord.

instance Ord Frac where
    (<=) :: Frac -> Frac -> Bool
    f1 <= f2 = a1 * b2 <= a2 * b1
        where F a1 b1 = normaliza f1
              F a2 b2 = normaliza f2

{-
(d) Defina Frac como instância da classe Show, de forma a que cada fracção seja
apresentada por (numerador/denominador).
-}

instance Show Frac where
    show :: Frac -> String
    show f = show a ++ "/" ++ show b
        where F a b = normaliza f

{-
(e) Defina Frac como instância da classe Num. Relembre que a classe Num tem a
seguinte definição
class (Eq a, Show a) => Num a where
(+), (*), (-) :: a -> a -> a
negate, abs, signum :: a -> a
fromInteger :: Integer -> a
-}

instance Num Frac where
    (+) :: Frac -> Frac -> Frac
    (F a1 b1) + (F a2 b2) = undefined

    (*) :: Frac -> Frac -> Frac
    (F a1 b1) * (F a2 b2) = undefined

    (-) :: Frac -> Frac -> Frac
    (F a1 b1) - (F a2 b2) = undefined

    negate :: Frac -> Frac -> Frac
    negate F a1 b1 = undefined
    
    abs :: Frac -> Frac -> Frac
    abs f = undefined

    signum :: Frac -> Frac -> Frac
    signum f1 f2 = undefined

    fromInteger :: Interger -> Frac
    fromInteger x = undefined
    
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