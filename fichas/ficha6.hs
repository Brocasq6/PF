module Ficha6 where
    
data BTree a = Empty
| Node a (BTree a) (BTree a)
deriving Show

-- (a) altura :: BTree a -> Int que calcula a altura da ´arvore.
-- (b) contaNodos :: BTree a -> Int que calcula o n´umero de nodos da ´arvore.
-- (c) folhas :: BTree a -> Int, que calcula o n´umero de folhas (i.e., nodos sem descendentes) da ´arvore.
-- (d) prune :: Int -> BTree a -> BTree a, que remove de uma ´arvore todos os elementos a partir de uma determinada profundidade.
{-
(e) path :: [Bool] -> BTree a -> [a], que dado um caminho (False corresponde
a esquerda e True a direita) e uma ´arvore, d´a a lista com a informa¸c˜ao dos nodos
por onde esse caminho passa.
-}
-- (f) mirror :: BTree a -> BTree a, que d´a a ´arvore sim´etrica.
-- (g) zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c que generaliza a fun¸c˜ao zipWith para ´arvores bin´arias.
{-
(h) unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c), que generaliza a
fun¸c˜ao unzip (neste caso de triplos) para ´arvores bin´arias.
-}

--2. Defina as seguintes fun¸c˜oes, assumindo agora que as ´arvores s˜ao bin´arias de procura:
{-
(a) Defina uma fun¸c˜ao minimo :: Ord a => BTree a -> a que determina o menor
elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}
{-
(b) Defina uma fun¸c˜ao semMinimo :: Ord a => BTree a -> BTree a que remove o
menor elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}
{-
(c) Defina uma fun¸c˜ao minSmin :: Ord a => BTree a -> (a,BTree a) que calcula,
com uma ´unica travessia da ´arvore o resultado das duas fun¸c˜oes anteriores.
-}

{-
(d) Defina uma fun¸c˜ao remove :: Ord a => a -> BTree a -> BTree a que remove
um elemento de uma ´arvore bin´aria de procura, usando a fun¸c˜ao anterior.
-}