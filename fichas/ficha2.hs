module Ficha2 where

{-
dobros :: [Float] -> [Float] que recebe uma lista e produz a lista em que
cada elemento ´e o dobro do valor correspondente na lista de entrada.
-}

dobros :: [Float] -> [Float]
dobros [] = [] 
dobros (h:t) = 2*h : dobros t

--------------------------------------
{-
(b) numOcorre :: Char -> String -> Int que calcula o n´umero de vezes que um
caracter ocorre numa string.
-}

numOcorre :: Char -> String -> Int
numOcorre x [] = 0
numOcorre x (h:t)
    | x == h = 1 + numOcorre x t
    | otherwise = numOcorre x t

{-
(c) positivos :: [Int] -> Bool que testa se uma lista s´o tem elementos positivos.
-}

positivos :: [Int] -> Bool
positivos [] = True 
positivos (h:t)
    | h > 0 = positivos t
    | otherwise = False

{-
(d) soPos :: [Int] -> [Int] que retira todos os elementos n˜ao positivos de uma
lista de inteiros.
-}

soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t)
    | h < 0 = soPos t
    | otherwise = h : soPos t

{-
(e) somaNeg :: [Int] -> Int que soma todos os n´umeros negativos da lista de entrada.
-}

somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (h:t)
    | h < 0 = h + somaNeg t
    | otherwise = somaNeg t

{-
(f) tresUlt :: [a] -> [a] devolve os ´ultimos trˆes elementos de uma lista. Se a
lista de entrada tiver menos de trˆes elementos, devolve a pr´opria lista.
1
-}

tresUlt :: [a] -> [a]
tresUlt [] = []
tresUlt l
    | length l < 3 = l
    | otherwise = tresUlt(tail l)


{-
(g) segundos :: [(a,b)] -> [b] que calcula a lista das segundas componentes dos
pares.
-}

segundos :: [(a,b)] -> [b]
segundos []  = []
segundos ((a,b):t) = b : segundos t

{-
(h) nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool que testa se um elemento
aparece na lista como primeira componente de algum dos pares.
-}

nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros x [] = False
nosPrimeiros x ((a,b):t)
    | x == a = True
    | otherwise = nosPrimeiros x t

{-
(i) sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c) soma uma
lista de triplos componente a componente.
Por exemplo, sumTriplos [(2,4,11), (3,1,-5), (10,-3,6)] = (15,2,12)
-}

sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [] = (0,0,0)
sumTriplos ((a,b,c):t) = (a + a', b + b', c + c')
  where (a', b', c') = sumTriplos t

-----------------------------------------------------------------------------------------
--Exercicio 4

type Polinomio = [Monomio]
type Monomio = (Float,Int)

-- (a) conta :: Int -> Polinomio -> Int de forma a que (conta n p) indica quantos mon´omios de grau n existem em p.

conta :: Int -> Polinomio -> Int 
conta n [] = 0 
conta n ((a,b):t)
    | n == b = 1 + conta n t
    | otherwise = conta n t

-- (b) grau :: Polinomio -> Int que indica o grau de um polin´omio.

-- grau [(1,3), (-4,2), (2,1), (7,0)] = 3

grau :: Polinomio -> Int
grau [m] = snd m
grau ((a,b):t)
    let g = grau t
    in 
        | e > g = e
        | otherwise = g 

{-
(c) selgrau :: Int -> Polinomio -> Polinomio que selecciona os mon´omios com
um dado grau de um polin´omio.
-}

selgrau :: Int -> Polinomio -> Polinomio
selgrau n [] = []
selgrau n ((a,b):t)
    | n == b = (a,b) : selgrau n t
    | otherwise = selgrau n t 

{-
(f) simp :: Polinomio -> Polinomio que retira de um polin´omio os mon´omios de
coeficiente zero.
-}

simp :: Polinomio -> Polinomio
sim [] = []
simp ((a,b):t)
    | a == 0 = simp t
    | otherwise = (a,b) : simp t

{-
(g) mult :: Monomio -> Polinomio -> Polinomio que calcula o resultado da mul-
tiplica¸c˜ao de um mon´omio por um polin´omio.
-}

mult :: Monomio -> Polinomio -> Polinomio
mult (a,b) [] = []
mult (a,b) ((c,d):t) = (a*c, b+d) : mult (a,b) t

{-
(i) soma :: Polinomio -> Polinomio -> Polinomio que soma dois polin´omios de
forma a que se os polin´omios que recebe estiverem normalizados produz tamb´em
um polin´omio normalizado.
-}

soma :: Polinomio -> Polinomio -> Polinomio
soma [] [] = []
soma p [] = p
soma [] p = p
soma ((a,b):t) ((c,d):s)
    | b == d = (a+c , b) : soma t s
    | b < d = (a,b) : soma t s
    | otherwise = (c,d) : soma t s 

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
