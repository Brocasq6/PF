
module Ficha1 where
import Data.Char
import Data.Time.Format.ISO8601 (yearFormat)
-- length l: o n´umero de elementos da lista l
-- head l: a cabe¸ca da lista (n˜ao vazia) l
-- tail l: a cauda da lista (n˜ao vazia) l
-- last l: o ´ultimo elemento da lista (n˜ao vazia) l
-- sqrt x: a raiz quadrada de x
-- div x y: a divis˜ao inteira de x por y
-- mod x y: o resto da divis˜ao inteira de x por y

----------------------------------------------------------------------------------

perimetro :: Float -> Float
perimetro r = 2*(pi*r)


----------------------------------------------------------------------------------

dist :: (Double,Double) -> (Double,Double) -> Double
dist (x1,y1) (x2,y2) = sqrt(((x2-x1)^2)-((y2-y1)^1))

----------------------------------------------------------------------------------

primUlt :: [Int] -> (Int,Int)
primUlt [] = (0,0)
primUlt (h:t) = (h, last t)


----------------------------------------------------------------------------------

multiplo :: Int -> Int -> Bool
multiplo x y 
        | y `mod` x == 0 = True
        |otherwise = False

----------------------------------------------------------------------------------

truncaImpar :: [Int] -> [Int]
truncaImpar [] = []
truncaImpar l
        | length l `mod` 2 == 0 = l
        | otherwise = drop 1 l

----------------------------------------------------------------------------------

max_2 :: Int -> Int -> Int
max_2 x y
        | x == 0 = y
        | y == 0 = x
        | x > y = x
        | otherwise = y

----------------------------------------------------------------------------------

max_3 :: Int -> Int -> Int -> Int
max_3 = undefined

------------------------------------------------------------------------------------

nRaizes :: Int -> Int -> Int -> Int
nRaizes = undefined

------------------------------------------------------------------------------------

type Hora = (Int,Int)

hora_val :: (Int,Int) -> Bool
hora_val = undefined

------------------------------------------------------------------------------------

hora_ad :: (Int,Int) -> (Int,Int) -> Bool
hora_ad = undefined

------------------------------------------------------------------------------------
horaParaMinutos :: (Int,Int) -> Int
horaParaMinutos = undefined

------------------------------------------------------------------------------------

minutosParaHora :: Int -> (Int,Int)
minutosParaHora = undefined

------------------------------------------------------------------------------------

h_dif :: (Int,Int) -> (Int,Int) -> Int
h_dif = undefined

h_dif2 :: Hora -> Hora -> Int
h_dif2 = undefined

------------------------------------------------------------------------------------

min_add :: Int -> (Int,Int) -> (Int,Int)
min_add = undefined
------------------------------------------------------------------------------------

data Semafro = Verde | Amarelo | Vermelho
        deriving (Show,Eq)

next :: Semafro -> Semafro
next = undefined
------------------------------------------------------------------------------------

stop :: Semafro -> Bool
stop = undefined
------------------------------------------------------------------------------------

safe :: Semafro -> Semafro -> Bool
safe = undefined
------------------------------------------------------------------------------------

data Ponto = Cartesiano Double Double | Polar Double Double
        deriving (Show,Eq)

posX :: Ponto -> Double
posX = undefined
------------------------------------------------------------------------------------

posY :: Ponto -> Double
posY = undefined
------------------------------------------------------------------------------------

raio :: Ponto -> Double
raio = undefined
------------------------------------------------------------------------------------

angulo :: Ponto -> Double
angulo = undefined
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

distFigura :: Ponto -> Ponto -> Double
distFigura = undefined
------------------------------------------------------------------------------------

data Figura = Circulo Ponto Double
                | Rectangulo Ponto Ponto
                | Triangulo Ponto Ponto Ponto
        deriving (Show,Eq)

poligono :: Figura -> Bool
poligono = undefined

vertcies :: Figura -> [Ponto]
vertcies = undefined

area :: Figura -> Double
area = undefined
-- completar

perimetroFigura :: Figura -> Double
perimetroFigura = undefined

-- usando funcoes ord :: Char -> Int
--              e chr :: Int -> Char

isLower :: Char -> Bool
isLower = undefined

isDigit :: Char -> Bool
isDigit = undefined

isAlpha :: Char -> Bool
isAlpha = undefined

toUpper :: Char -> Char
toUpper = undefined

intToDigit :: Int -> Char
intToDigit = undefined

digitToInt :: Char -> Int
digitToInt = undefined