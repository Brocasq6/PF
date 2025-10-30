module Ficha4 where
import Data.Char (isAlpha,isDigit)

{-
1. Defina a fun¸c˜ao digitAlpha :: String -> (String,String), que dada uma string,
devolve um par de strings: uma apenas com as letras presentes nessa string, e a outra
apenas com os n´umeros presentes na string. Implemente a fun¸c˜ao de modo a fazer uma
´unica travessia da string. Relembre que as fun¸c˜oes isDigit,isAlpha :: Char -> Bool
est˜ao j´a definidas no m´odulo Data.Char.
-}
-- digitAlpha [1,a,2,b,3] = ((1,2,3),(a,b,c))

digitAlpha :: String -> (String,String)
digitAlpha [] = ("","") -- para que nao de aso a erros usar ([],[])
digitAlpha (h:t)         
    | isAlpha h = (h:letras,digitos) --caso h seja uma letra
    | isDigit h = (letras,h:digitos) --caso h seja um numero
    | otherwise = (letras,digitos)
    where 
        (letras,digitos) = digitAlpha t

-- digitAlphaSaraiva :: String -> (String,String)
-- digitAlphaSaraiva s = digitAlphaAc s ([],[]) 
--     where 
--         digitAlphaAC :: String -> (String,String) -> (String,String)
--         digitAlphaAc [] ac = ac
--         digitAlphaAc (h:t) (ls,ds)
--             | isAlpha h = digitAlphaAc t (ls++[h],ds)
--             | isDigit h = digitAlphaAc t (ls,ds++[h])
--             | otherwise = digitAlphaAc t (ls,ds)

{-
2. Defina a fun¸c˜ao nzp :: [Int] -> (Int,Int,Int) que, dada uma lista de inteiros,
conta o n´umero de valores nagativos, o n´umero de zeros e o n´umero de valores positivos,
devolvendo um triplo com essa informa¸c˜ao. Certifique-se que a fun¸c˜ao que definiu
percorre a lista apenas uma vez.
-}
isNeg :: Int -> Bool 
isNeg x
    | x < 0 = True
    | otherwise = False

isPos :: Int -> Bool
isPos x
    | x > 0 = True
    | otherwise = False

isZero :: Int -> Bool
isZero x
    | x == 0 = True
    | otherwise = False



nzp :: [Int] -> (Int,Int,Int)
nzp [] = ([],[],[])
nzp (h:t)
    | isZero h = (1+zer,pos,neg) 
    | isPos = (zer,1+pos,neg)
    | isNeg = (zer,pos,1+neg)
    | otherwise = (zer,pos,neg)
    where 
        (zer,pos,neg) = nzp t
{-
3. Defina a fun¸c˜ao divMod :: Integral a => a -> a -> (a, a) que calcula simultane-
amente a divis˜ao e o resto da divis˜ao inteira por subtrac¸c˜oes sucessivas.
-}
divMod :: Integral a => a -> a -> (a, a)
divMod = undefined

{-
4. Utilizando uma fun¸c˜ao auxiliar com um acumulador, optimize seguinte defini¸c˜ao recur-
siva que determina qual o n´umero que corresponde a uma lista de digitos.

fromDigits :: [Int] -> Int
fromDigits [] = 0
fromDigits (h:t) = h*10^(length t) + fromDigits t

Note que:
fromDigits [1,2,3,4] = 1 × 103 + 2 × 102 + 3 × 101 + 4 × 100 
                     = 4 + 10 × (3 + 10 × (2 + 10 × (1 + 10 × 0)))
-}

fromDigits2 :: [Int] -> Int
--fromDigits2 l = fromDigitsAux l 0
fromDigits2 l = undefined

{-
5. Utilizando uma fun¸c˜ao auxiliar com acumuladores, optimize seguinte defini¸c˜ao que
determina a soma do segmento inicial de uma lista com soma m´axima.
maxSumInit :: (Num a, Ord a) => [a] -> a
maxSumInit l = maximum [sum m | m <- inits l]
-}

maxSumInit2 :: (Num a, Ord a) => [a] -> a
maxSumInit2 l = undefined

maxSumInit2aux = undefined
{-
6. Optimize a seguinte defini¸c˜ao recursiva da fun¸c˜ao que calcula o n-´esimo n´umero da
sequˆencia de Fibonacci, usando uma fun¸c˜ao auxiliar com 2 acumuladores que represen-
tam, respectivamente, o n-´esimo e o n+1-´esimo n´umeros dessa sequˆencia.


fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
-}

fib2 :: Int -> Int
fib2 n = undefined

fib2aux :: Int -> Int 
fib2aux = undefined

{-
7. Defina a fun¸c˜ao intToStr :: Integer -> String que converte um inteiro numa
string. Utilize uma fun¸c˜ao auxiliar com um acumulador onde vai construindo a string
que vai devolver no final.
-}

intToStr :: Integer -> String
intToStr n = undefined

{-
8. Para cada uma das express˜oes seguintes, exprima por enumera¸c˜ao a lista correspon-
dente. Tente ainda, para cada caso, descobrir uma outra forma de obter o mesmo
resultado.
(a) [x | x <- [1..20], mod x 2 == 0, mod x 3 == 0]
(b) [x | x <- [y | y <- [1..20], mod y 2 == 0], mod x 3 == 0]
(c) [(x,y) | x <- [0..20], y <- [0..20], x+y == 30]
(d) [sum [y | y <- [1..x], odd y] | x <- [1..10]]
-}



-- 9. Defina cada uma das listas seguintes por compreens˜ao.

--(a) [1,2,4,8,16,32,64,128,256,512,1024]



--(b) [(1,5),(2,4),(3,3),(4,2),(5,1)]




--(c) [[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5]]




--(d) [[1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1]]




--(e) [1,2,6,24,120,720]


