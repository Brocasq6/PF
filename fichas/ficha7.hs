Module ficha7 where

data ExpInt = Const Int
            | Simetrico ExpInt
            | Mais ExpInt ExpInt
            | Menos ExpInt ExpInt
            | Mult ExpInt ExpInt
            
{-
1. Considere o seguinte tipo para representar expressões inteiras.
Os termos deste tipo ExpInt podem ser vistos como árvores cujas folhas são inteiros e
cujos nodos (não folhas) são operadores.
-}

{-
(a) Defina uma função calcula :: ExpInt -> Int que, dada uma destas expressões
calcula o seu valor.
-}

{-
(b) Defina uma função infixa :: ExpInt -> String de forma a que
infixa (Mais (Const 3) (Menos (Const 2) (Const 5))) dê como resultado
"(3 + (2 - 5))".
-}

{-
(c) Defina uma outra função de conversão para strings posfixa :: ExpInt -> String
de forma a que quando aplicada à expressão acima dê como resultado "3 2 5 -
+".
-}

{-
2. Considere o seguinte tipo para representar árvores irregulares (rose trees).
data RTree a = R a [RTree a]
Defina as seguintes funções sobre estas árvores:
-}

--(a) soma :: Num a => RTree a -> a que soma os elementos da árvore.

--(b) altura :: RTree a -> Int que calcula a altura da árvore.

{-
(c) prune :: Int -> RTree a -> RTree a que remove de uma árvore todos os ele-
mentos a partir de uma determinada profundidade.
-}

--(d) mirror :: RTree a -> RTree a que gera a árvore simétrica.

--(e) postorder :: RTree a -> [a] que corresponde à travessia postorder da árvore.