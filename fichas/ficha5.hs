module Ficha5 where
import Data.List


{-
1. Apresente defini¸c˜oes das seguintes fun¸c˜oes de ordem superior, j´a pr´e-definidas no Prelude
ou no Data.List:
-}

{-
(a) any :: (a -> Bool) -> [a] -> Bool que teste se um predicado ´e verdade para
algum elemento de uma lista; por exemplo:
any odd [1..10] == True
-}

any :: (a -> Bool) -> [a] -> Bool
any predicado [] = False
any predicado (x:xs)
    | predicado x = False 
    | otherwise = any predicado x

{-
(b) zipWith :: (a->b->c) -> [a] -> [b] -> [c] que combina os elementos de
duas listas usando uma fun¸c˜ao espec´ıfica; por exemplo:
zipWith (+) [1,2,3,4,5] [10,20,30,40] == [11,22,33,44].
-}

zipWith :: (a->b->c) -> [a] -> [b] -> [c]
zipWith funcao [] [] = []
zipWith funcao _ [] = _
zipWith funcao [] _ = _
zipWith funcao (x:xs) (y:ys) = funcao x y : zipWith funcao xs ys

{-
(c) takeWhile :: (a->Bool) -> [a] -> [a] que determina os primeiros elementos
da lista que satisfazem um dado predicado; por exemplo:
takeWhile odd [1,3,4,5,6,6] == [1,3].
-}

takeWhile :: (a->Bool) -> [a] -> [a]
takeWhile funcao [] = []
takeWhile funcao (x:xs) (y:ys) =
    | funcao x = x : takeWhile funcao xs 
    | otherwise = []

{-(d) dropWhile :: (a->Bool) -> [a] -> [a] que elimina os primeiros elementos da
lista que satisfazem um dado predicado; por exemplo:
dropWhile odd [1,3,4,5,6,6] == [4,5,6,6].
-}

dropWhile :: (a->Bool) -> [a] -> [a]
dropWhile funcao [] = []
dropWhile funcao (x:xs) = 
    | funcao x = dropWhile f xs 
    | othwerise = x : xs

{-(e) span :: (a-> Bool) -> [a] -> ([a],[a]), que calcula simultaneamente os dois
resultados anteriores. Note que apesar de poder ser definida `a custa das outras
duas, usando a defini¸c˜ao
span p l = (takeWhile p l, dropWhile p l)
nessa defini¸c˜ao h´a trabalho redundante que pode ser evitado. Apresente uma
defini¸c˜ao alternativa onde n˜ao haja duplica¸c˜ao de trabalho.
-}

span :: (a-> Bool) -> [a] -> ([a],[a])
span _ [] = ([],[])
span p (x:xs)
    | p x = (x:st , sd)
    | otherwise = ([],x:xs)

    where (st,sd) = span p xs 


{-(f) deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a] que apaga o primeiro elemento de uma lista que ´e “igual” a um dado elemento de acordo com a fun¸c˜ao
de compara¸c˜ao que ´e passada como parˆametro. Por exemplo:
deleteBy (\x y -> snd x == snd y) (1,2) [(3,3),(2,2),(4,2)]
-}

deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy _ _ [] = []
deleteBy funcao v (x:xs) = 
    | funcao x v = xs
    | otherwise = deleteBy funcao v xs 

{-
(g) sortOn :: Ord b => (a -> b) -> [a] -> [a] que ordena uma lista comparando os resultados de aplicar uma fun¸c˜ao de extrac¸c˜ao de uma chave a cada elemento de uma lista. Por exemplo:
sortOn fst [(3,1),(1,2),(2,5)] == [(1,2),(2,5),(3,1)].
-}

sortOn :: Ord b => (a -> b) -> [a] -> [a]

insert :: Ord b 
insert _ x [] = [x]
insert funcao x (h:t) 
    | funcao x < funcao h x = x : h : t
    | otherwise = h : insert funcao x t

type Mat a = [[a]]

-- (a) dimOK :: Mat a -> Bool que testa se uma matriz est´a bem constru´ıda (i.e., se todas as linhas tˆem a mesma dimens˜ao).

dimOk :: Mat a -> Bool
dimOk l = length(nub(map length l)) == 1

-- (b) dimMat :: Mat a -> (Int,Int) que calcula a dimens˜ao de uma matriz.

dimMat :: Mat a -> (Int,Int)
dimMat l = (length l , length (head l))

-- (c) addMat :: Num a => Mat a -> Mat a -> Mat a que adiciona duas matrizes.

addMat :: Num a => Mat a -> Mat a -> Mat a 
addMat (l1:ls1) (l2:ls2) = zipWith (+) l1 l2 : addMat ls1 ls2 -- usamos a zipwith para adicioar a primeira lista e depois apenas chamamos recursivamente a funcao addMat

-- (d) transpose :: Mat a -> Mat a que calcula a transposta de uma matriz.
primeiraCol :: Mat a -> [a]
primeiraCol m = map head m

restantesCol :: Mat a -> Mat a
restantesCol m = map tail m

transpose :: Mat a -> Mat a
transpose [] = []
transpose m =
    | map(head m) == [] = []
    | otherwise = primeiraCol m : transpose (restoCol m)

-- (e) multMat :: Num a => Mat a -> Mat a -> Mat a que calcula o produto de duas matrizes.

multMat :: Num a => Mat a -> Mat a -> Mat a
multMat [] [] = []
multMat 
-- (f) zipWMat :: (a -> b -> c) -> Mat a -> Mat b -> Mat c que, `a semelhan¸ca do que acontece com a fun¸c˜ao zipWith,
--combina duas matrizes. Use essa fun¸c˜ao para definir uma fun¸c˜ao que adiciona duas matrizes.

-- (g) triSup :: Num a => Mat a -> Bool que testa se uma matriz quadrada ´e triangular superior 
-- (i.e., todos os elementos abaixo da diagonal s˜ao nulos).

{-
(h) rotateLeft :: Mat a -> Mat a que roda uma matriz 90o para a esquerda. Por
exemplo, o resultado de rodar a matriz acima apresentada deve corresponder `a matriz

[[3 5 6],
 [2 4 0],
 [1 0 0]]

-}