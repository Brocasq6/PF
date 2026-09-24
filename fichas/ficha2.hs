module Ficha2 where

{-
dobros :: [Float] -> [Float] que recebe uma lista e produz a lista em que
cada elemento ´e o dobro do valor correspondente na lista de entrada.
-}

dobros :: [Float] -> [Float]
dobros = undefined


--------------------------------------
{-
(b) numOcorre :: Char -> String -> Int que calcula o n´umero de vezes que um
caracter ocorre numa string.
-}

numOcorre :: Char -> String -> Int
numOcorre = undefined


{-
(c) positivos :: [Int] -> Bool que testa se uma lista s´o tem elementos positivos.
-}

positivos :: [Int] -> Bool
positivos = undefined


{-
(d) soPos :: [Int] -> [Int] que retira todos os elementos n˜ao positivos de uma
lista de inteiros.
-}

soPos :: [Int] -> [Int]
soPos = undefined


{-
(e) somaNeg :: [Int] -> Int que soma todos os n´umeros negativos da lista de entrada.
-}

somaNeg :: [Int] -> Int
somaNeg = undefined


{-
(f) tresUlt :: [a] -> [a] devolve os ´ultimos trˆes elementos de uma lista. Se a
lista de entrada tiver menos de trˆes elementos, devolve a pr´opria lista.
1
-}

tresUlt :: [a] -> [a]
tresUlt = undefined



{-
(g) segundos :: [(a,b)] -> [b] que calcula a lista das segundas componentes dos
pares.
-}

segundos :: [(a,b)] -> [b]
segundos = undefined


{-
(h) nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool que testa se um elemento
aparece na lista como primeira componente de algum dos pares.
-}

nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros = undefined


{-
(i) sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c) soma uma
lista de triplos componente a componente.
Por exemplo, sumTriplos [(2,4,11), (3,1,-5), (10,-3,6)] = (15,2,12)
-}

sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos = undefined


-----------------------------------------------------------------------------------------
-- Exercicio 3

soDigitos :: [Char] -> [Char]
soDigitos l = undefined

minusculas :: [Char] -> Int
minusculas l = undefined

nums :: String -> [Int]
nums s = undefined

-----------------------------------------------------------------------------------------
--Exercicio 4

type Polinomio = [Monomio]
type Monomio = (Float,Int)

-- (a) conta :: Int -> Polinomio -> Int de forma a que (conta n p) indica quantos mon´omios de grau n existem em p.

conta :: Int -> Polinomio -> Int 
conta = undefined


-- (b) grau :: Polinomio -> Int que indica o grau de um polin´omio.

-- grau [(1,3), (-4,2), (2,1), (7,0)] = 3

grau :: Polinomio -> Int
grau = undefined


{-
(c) selgrau :: Int -> Polinomio -> Polinomio que selecciona os mon´omios com
um dado grau de um polin´omio.
-}

selgrau :: Int -> Polinomio -> Polinomio
selgrau = undefined




{-
(d) deriv :: Polinomio -> Polinomio que calcula a derivada de um polinómio.
-}


{-
e) calcula :: Float -> Polinomio -> Float que calcula o valor de um polinómio
para uma dado valor de x.
-}


{-
(f) simp :: Polinomio -> Polinomio que retira de um polin´omio os mon´omios de
coeficiente zero.
-}

simp :: Polinomio -> Polinomio
simp = undefined

{-


(g) mult :: Monomio -> Polinomio -> Polinomio que calcula o resultado da mul-
tiplica¸c˜ao de um mon´omio por um polin´omio.
-}

mult :: Monomio -> Polinomio -> Polinomio
mult = undefined


{-
(h) normaliza :: Polinomio -> Polinomio que dado um polinómio constrói um
polinómio equivalente em que não podem aparecer varios monómios com o mesmo
grau.
-}

{-
(i) soma :: Polinomio -> Polinomio -> Polinomio que soma dois polin´omios de
forma a que se os polin´omios que recebe estiverem normalizados produz tamb´em
um polin´omio normalizado.
-}

soma :: Polinomio -> Polinomio -> Polinomio
soma = undefined


{-
(j) produto :: Polinomio -> Polinomio -> Polinomio que calcula o produto de
dois polin´omios
-}

{-
(k) ordena :: Polinomio -> Polinomio que ordena um polin´omio por ordem cres-
cente dos graus dos seus mon´omios.
-}

{-
(l) equiv :: Polinomio -> Polinomio -> Bool que testa se dois polin´omios s˜ao
equivalentes.
2
-}
