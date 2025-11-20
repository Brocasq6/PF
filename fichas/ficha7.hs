module Ficha7 where

{-
1. Considere o seguinte tipo para representar expressões inteiras.
Os termos deste tipo ExpInt podem ser vistos como árvores cujas folhas são inteiros e
cujos nodos (não folhas) são operadores.
-}

{-
(a) Defina uma função calcula :: ExpInt -> Int que, dada uma destas expressões
calcula o seu valor.
-}
data ExpInt 
    = Const Int
    | Simetrico ExpInt
    | Mais ExpInt ExpInt
    | Menos ExpInt ExpInt
    | Mult ExpInt ExpInt

calcula :: ExpInt -> Int
calcula (Const x)     = x
calcula (Simetrico x) = - (calcula x)
calcula (Mais x y)    = (calcula x) + (calcula y)
calcula (Menos x y)   = (calcula x) - (calcula y)
calcula (Mult  x y)   = (calcula x) * (calcula y)

{-
(b) Defina uma função infixa :: ExpInt -> String de forma a que
infixa (Mais (Const 3) (Menos (Const 2) (Const 5))) dê como resultado
"(3 + (2 - 5))".
-}

infixa :: ExpInt -> String
infixa (Const x)        = show x
infixa (Simetrico x)    = "-" ++ "(" ++ infixa x ++ ")"
infixa (Mais x1 x2)     = "(" ++ infixa x1 ++ "+" ++ infixa x2 ++ ")"
infixa (Menos x1 x2)    = "(" ++ infixa x1 ++ "-" ++ infixa x2 ++ ")"
infixa (Mult x1 x2)     = "(" ++ infixa x1 ++ "*" ++ infixa x2 ++ ")"

{-
(c) Defina uma outra função de conversão para strings posfixa :: ExpInt -> String
de forma a que quando aplicada à expressão acima dê como resultado "3 2 5 -
+".
-}

posFixa :: ExpInt -> String
posFixa (Const x)       = show x
posFixa (Simetrico x)   = "-" ++ posFixa x
posFixa (Mais x1 x2)    = (infixa x1) ++ (infixa x2) ++ "+"
posFixa (Menos x1 x2)   = (infixa x1) ++ (infixa x2) ++ "-"     
posFixa (Mult x1 x2)    = (infixa x1) ++ (infixa x2) ++ "*"


---------------------- Exercicio 2 ----------------------

{-
2. Considere o seguinte tipo para representar árvores irregulares (rose trees).
data RTree a = R a [RTree a]
Defina as seguintes funções sobre estas árvores:
-}

--(a) soma :: Num a => RTree a -> a que soma os elementos da árvore.

soma :: Num a => RTree a -> a
soma = undefined

--(b) altura :: RTree a -> Int que calcula a altura da árvore.

altura :: RTree a -> Int
altura = undefined

{-
(c) prune :: Int -> RTree a -> RTree a que remove de uma árvore todos os ele-
mentos a partir de uma determinada profundidade.
-}

prune :: Int -> RTree a -> RTree a
prune = undefined

--(d) mirror :: RTree a -> RTree a que gera a árvore simétrica.

mirror :: RTree a -> RTree a
mirror = undefined

--(e) postorder :: RTree a -> [a] que corresponde à travessia postorder da árvore.

postorder :: RTree a -> [a]
postorder = undefined