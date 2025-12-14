module Ficha1 where
import Data.Char
-- length l: o n´umero de elementos da lista l
-- head l: a cabe¸ca da lista (n˜ao vazia) l
-- tail l: a cauda da lista (n˜ao vazia) l
-- last l: o ´ultimo elemento da lista (n˜ao vazia) l
-- sqrt x: a raiz quadrada de x
-- div x y: a divis˜ao inteira de x por y
-- mod x y: o resto da divis˜ao inteira de x por y

----------------------------------------------------------------------------------

perimetro :: Float -> Float
perimetro l = 2 * 3.14 * l

----------------------------------------------------------------------------------

dist :: (Double,Double) -> (Double,Double) -> Double
dist (x1,y1) (x2,y2) = sqrt ((x2-x1)^2 + (y2-y1)^2)

----------------------------------------------------------------------------------

primUlt :: [Int] -> (Int,Int)
primUlt l = (head l, last l)

----------------------------------------------------------------------------------

multiplo :: Int -> Int -> Bool
multiplo m n 
        | m `mod` n == 0 = True
        | otherwise = False

----------------------------------------------------------------------------------

truncaImpar :: [Int] -> [Int]
truncaImpar l
        |odd (length l) = tail l
        |otherwise = l

----------------------------------------------------------------------------------

max_2 :: Int -> Int -> Int
max_2 a b
        | a > b = a
        | otherwise = b

----------------------------------------------------------------------------------

max_3 :: Int -> Int -> Int -> Int
max_3 a b c = max_2 (max_2 a b) c

-----------------------------------------------------------------------------------

nRaizes :: Int -> Int -> Int -> Int
nRaizes a b c
        |delta < 0 = 0
        |delta > 0 = 2
        |otherwise = 1
        where
                delta = b^2 - 4*a*c

------------------------------------------------------------------------------------

type Hora = (Int,Int)

hora_val :: (Int,Int) -> Bool
hora_val (a,b)
        | a >= 0 && a < 24 && b >= 0 && b < 60 = True
        | otherwise = False

------------------------------------------------------------------------------------

hora_ad :: (Int,Int) -> (Int,Int) -> Bool
hora_ad (h1,m1) (h2,m2)
        | h1 == h2 && m1 > m2 = True
        | h1 == h2 && m1 < m2 = False
        | h1 > h2 && m1 > m2 = True
        | h1 > h2 && m1 < m2 = True
        | h1 < h2 && m1 > m2 = False
        | h1 < h2 && m1 < m2 = False
        | otherwise = False
        
------------------------------------------------------------------------------------ 
horaParaMinutos :: (Int,Int) -> Int
horaParaMinutos (h,m) = h*60 + m

------------------------------------------------------------------------------------ 

minutosParaHora :: Int -> (Int,Int)
minutosParaHora x = (div x 60 , mod x 60)

------------------------------------------------------------------------------------

h_dif :: (Int,Int) -> (Int,Int) -> Int
h_dif (x,y) (z,w) = abs(x-z)*60 + abs (y-w)

h_dif2 :: Hora -> Hora -> Int
h_dif2 (x,y) (z,w) = abs(horaParaMinutos(x,y) -horaParaMinutos(z,w))
h_dif2 h1 h2 = abs(horaParaMinutos(h2) - horaParaMinutos(h2))
------------------------------------------------------------------------------------

min_add :: Int -> (Int,Int) -> (Int,Int)
min_add h m = miutosParaHoras((horaParaMinutos(h))+m)

------------------------------------------------------------------------------------

data Semafro = Verde | Amarelo | Vermelho
	deriving (Show,Eq)

next :: Semafro -> Semafro
next Verde = Amarelo
next Amarelo = Vermelho
next Vermelho = Verde

------------------------------------------------------------------------------------

stop :: Semafro -> Bool
stop Vermelho = True
stop Verde = False 
stop Amarelo = True

------------------------------------------------------------------------------------

safe :: Semafro -> Semafro -> Bool
safe Verde Verde = False 
safe Verde Amarelo = False
safe Vermelho Verde = True
safe Verde Vermelho = True
safe Amarelo _ = False
safe _ Amarelo = False

------------------------------------------------------------------------------------

data Ponto = Cartesiano Double Double | Polar Double Double
        deriving (Show,Eq)

posX :: Ponto -> Double
posX (Cartesiano x _) = x
posX (Polar x y) = x * cos y

------------------------------------------------------------------------------------

posY :: Ponto -> Double
posY (Polar x y) = x * sin y
posY (Cartesiano x y) = y 

------------------------------------------------------------------------------------

raio :: Ponto -> Double
raio (Cartesiano x y) = sqrt(x^2 + y^2)
raio (Polar x y) = x 

------------------------------------------------------------------------------------

angulo :: Ponto -> Double
angulo (Cartesiano x y) = atan2 y x
angulo (Polar x y) = y

------------------------------------------------------------------------------------

------------------------------------------------------------------------------------

dist :: Ponto -> Ponto -> Double
dist (Cartsianp (0,0) _ ) = _ 
dist (Cartesiano _ (0,0)) = _ 
dist (Cartesiano (x1,y1) (x2,y2)) = sqrt(abs((x1-x2)^2 + (y1-y2)^2))

------------------------------------------------------------------------------------

data Figura = Circulo Ponto Double
            | Rectangulo Ponto Ponto
            | Triangulo Ponto Ponto Ponto
deriving (Show,Eq)

poligono :: Figura -> Bool
poligono figura =
        case figura of
                Circulo p1 d1           -> False
                Rectangulo p1 p1        -> True
                Triangulo p1 p2 p3      -> True
                


vertcies :: Figura -> [Ponto]
vertcies figura = 
        case figura of 
                Circulo (x1,y1) _                       -> []
                Rectangulo (x1,y1) (x2,y2)              -> [(x1,y1),(x1,y2),(x2,y1),(x2,y2)]
                Triangulo (x1,y1) (x2,y2) (x3,y3)       -> [(x1,y1),(x2,y2),(x3,y3)]

area :: Figura -> Double
area (Triangulo p1 p2 p3) =
        let a = dist p1 p2
            b = dist p2 p3
            c = dist p3 p1
            s = (a+b+c) / 2 -- semi-perimetro
        in sqrt (s*(s-a)*(s-b)*(s-c)) -- formula de Heron
area (Rectangulo (x1,y1) (x2,y2)) = dist((x1,y1) (x2,y1)) * dist((x1,y1) (x1,y2))
area (Circulo _ r) = (pi)*(r^2)

-- completar

perimetro :: Figura -> Double
perimetro figura = 
        case figura of 
                perimetro (Circulo (x1,y1) r)                   ->  
                perimetro (Rectangulo (x1,y1) (x2,y2))          -> 2*(dist (x1,y1) (x2,y1)) + 2*(dist (x1,y1) (x1,y2))
                perimetro (Triangulo (x1,y1) (x2,y2) (x3,y3))   -> ((dist (x1,y1) (x2,y1)) * altura) / 2

-- usando funcoes ord :: Char -> Int 
--              e chr :: Int -> Char

isLower :: Char -> Bool
isLower c = 'a' <= c <= 'z'

isDigit :: Char -> Bool
isDigit d = '0' <= d <= '9'

isAlpha :: Char -> Bool
isAlpha a = 'A' <= a <= 'z'


toUpper :: Char -> Char
toUpper c
    | c >= 'a' && c <= 'z'      = toEnum (fromEnum c - 32)
    | otherwise                 = c

intToDigit :: Int -> Char
intToDigit n
    | n >= 0 && n <= 9  = toEnum (n + fromEnum '0')
    | otherwise         = error "intToDigit: argumento fora do intervalo 0..9"

digitToInt :: Char -> Int
digitToInt c
    | c >= '0' && c <= '9'      = fromEnum c - fromEnum '0'
    | otherwise                 = error "digitToInt: caracter nao e um digito"
