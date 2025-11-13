module Ficha6 where
    
data BTree a = Empty
| Node a (BTree a) (BTree a)
deriving Show

-- | (a) altura :: BTree a -> Int que calcula a altura da ´arvore.

altura :: BTree a -> Int
altura Empty  = 0
altura Node _ e d = 1 + max(altura e,altura d) 

-- | (b) contaNodos :: BTree a -> Int que calcula o n´umero de nodos da ´arvore.

contaNodos :: BTree a -> Int 
contaNodos Empty = 0
contaNodos (Node _ e d) = 1 + (contaNodos e) + (contaNodos d)

-- | (c) folhas :: BTree a -> Int, que calcula o n´umero de folhas (i.e., nodos sem descendentes) da ´arvore.

folhas :: BTree a -> Int
folhas = undefined

-- | (d) prune :: Int -> BTree a -> BTree a, que remove de uma ´arvore todos os elementos a partir de uma determinada profundidade.

prune :: Int -> BTree a -> BTree a
prune = undefined

{-
(e) path :: [Bool] -> BTree a -> [a], que dado um caminho (False corresponde
a esquerda e True a direita) e uma ´arvore, d´a a lista com a informa¸c˜ao dos nodos
por onde esse caminho passa.
-}

path :: [Bool] -> BTree a -> [a]
path = undefined

-- | (f) mirror :: BTree a -> BTree a, que d´a a ´arvore sim´etrica.

mirror :: BTree a -> BTree a
mirror = undefined

-- | (g) zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c que generaliza a fun¸c˜ao zipWith para ´arvores bin´arias.
zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT = undefined

{-
(h) unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c), que generaliza a
fun¸c˜ao unzip (neste caso de triplos) para ´arvores bin´arias.
-}

unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c)
unzipBT = undefined

-- | 2. Defina as seguintes fun¸c˜oes, assumindo agora que as ´arvores s˜ao bin´arias de procura:

{-
(a) Defina uma fun¸c˜ao minimo :: Ord a => BTree a -> a que determina o menor
elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}

minimo :: Ord a => BTree a -> a
minimo = undefined

{-
(b) Defina uma fun¸c˜ao semMinimo :: Ord a => BTree a -> BTree a que remove o
menor elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}

semMinimo :: Ord a => BTree a -> BTree a
semMinimo = undefined

{-
(c) Defina uma fun¸c˜ao minSmin :: Ord a => BTree a -> (a,BTree a) que calcula,
com uma ´unica travessia da ´arvore o resultado das duas fun¸c˜oes anteriores.
-}

minSmin :: Ord a => BTree a -> (a,BTree a)
minSmin = undefined
{-
(d) Defina uma fun¸c˜ao remove :: Ord a => a -> BTree a -> BTree a que remove
um elemento de uma ´arvore bin´aria de procura, usando a fun¸c˜ao anterior.
-}

remove :: Ord a => a -> BTree a -> BTree a
remove = undefined