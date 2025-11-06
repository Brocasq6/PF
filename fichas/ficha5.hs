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
    | funcao x = xs 
    | othwerise = x : dropWhile funcao xs
    
{-(e) span :: (a-> Bool) -> [a] -> ([a],[a]), que calcula simultaneamente os dois
resultados anteriores. Note que apesar de poder ser definida `a custa das outras
duas, usando a defini¸c˜ao
span p l = (takeWhile p l, dropWhile p l)
nessa defini¸c˜ao h´a trabalho redundante que pode ser evitado. Apresente uma
defini¸c˜ao alternativa onde n˜ao haja duplica¸c˜ao de trabalho.
-}

{-(f) deleteBy :: (a -> a -> Bool) -> a -> [a] -> [a] que apaga o primeiro elemento de uma lista que ´e “igual” a um dado elemento de acordo com a fun¸c˜ao
de compara¸c˜ao que ´e passada como parˆametro. Por exemplo:
deleteBy (\x y -> snd x == snd y) (1,2) [(3,3),(2,2),(4,2)]
-}

{-
(g) sortOn :: Ord b => (a -> b) -> [a] -> [a] que ordena uma lista comparando os resultados de aplicar uma fun¸c˜ao de extrac¸c˜ao de uma chave a cada elemento de uma lista. Por exemplo:
sortOn fst [(3,1),(1,2),(2,5)] == [(1,2),(2,5),(3,1)].
-}