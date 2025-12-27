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

data RTree a = R a [RTree a]
r1 = R 1 [R 2 [R 4 []], R 3 [R 5 [], R 6 []]]

--(a) soma :: Num a => RTree a -> a que soma os elementos da árvore.

soma :: Num a => RTree a -> a
soma (R x l) = x + sum(map soma l)

--(b) altura :: RTree a -> Int que calcula a altura da árvore.

altura :: RTree a -> Int
altura (R x l) = 1 + maximum(map altura l)

{-
(c) prune :: Int -> RTree a -> RTree a que remove de uma árvore todos os ele-
mentos a partir de uma determinada profundidade.
-}

prune :: Int -> RTree a -> RTree a
prune 1 (R a l) = R a []
prune x (R a l) = R a (map (prune (x-1)) l)  

--(d) mirror :: RTree a -> RTree a que gera a árvore simétrica.

mirror :: RTree a -> RTree a
mirror (R a l) = R a (map mirror(reverse l))

--(e) postorder :: RTree a -> [a] que corresponde à travessia postorder da árvore.

postorder :: RTree a -> [a]
postorder (R r l) = concat (map postorder l) ++ [r]

---------------------- Exercicio 3 ----------------------

data BTree a = Empty | Node a (BTree a) (BTree a)

{-
3. Relembre a definição de árvores binárias apresentada na ficha anterior:
Nestas árvores a informação está nos nodos (as extermidades da árvore têm apenas
uma marca – Empty). É também habitual definirem-se árvores em que a informação
está apenas nas extermidades (leaf trees):
-}

data LTree a = Tip a | Fork (LTree a) (LTree a)


-- (a) ltSum :: Num a => LTree a -> a que soma as folhas de uma árvore.

{-
(b) listaLT :: LTree a -> [a] que lista as folhas de uma árvore (da esquerda para
a direita).
-}

-- (c) ltHeight :: LTree a -> Int que calcula a altura de uma árvore.


---------------------- Exercicio 4 ----------------------

-- 4. Estes dois conceitos podem ser agrupados num só, definindo o seguinte tipo:

data FTree a b = Leaf b | No a (FTree a b) (FTree a b)
{-
São as chamadas full trees onde a informação está não só nos nodos, como também nas
folhas (note que o tipo da informação nos nodos e nas folhas não tem que ser o mesmo).
-}

{-
(a) Defina a função splitFTree :: FTree a b -> (BTree a, LTree b) que separa
uma árvore com informação nos nodos e nas folhas em duas árvores de tipos
diferentes.
-}

{-
(b) Defina ainda a função joinTrees :: BTree a -> LTree b -> Maybe (FTree a b)
que sempre que as árvores sejam compatı́veis as junta numa só.
-}