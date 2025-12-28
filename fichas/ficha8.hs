module Ficha8 where


data Frac = F Interger Interger

{-
(a) Defina a função normaliza :: Frac -> Frac, que dada uma fracção calcula uma
fracção equivalente, irredutı́vel, e com o denominador positivo. Por exemplo,
normaliza (F (-33) (-51)) deve retornar F 11 17 e normaliza (F 50 (-5))
deve retornar F (-10) 1. Sugere-se que comece por definir primeiro a função
mdc :: Integer -> Integer -> Integer que calcula o máximo divisor comum
entre dois números, baseada na seguinte propriedade (atribuida a Euclides):
mdc x y == mdc (x+y) y == mdc x (y+x)
-}

normaliza :: Frac -> Frac
normaliza (F a b)
    | b < 0 = normaliza ( F (-a) (-b) )
    | otherwise = 
        let d = mdc a b in
        F (a `div` d) (b `div` d)

mdc :: Integer -> Integer -> Integer
mdc x 0 = x
mdc 0 y = y
mdc x y = mdc y (x `mod` y)

-- (b) Defina Frac como instância da classe Eq.

instance Eq Frac where
    (==) :: Frac -> Frac -> Bool
    f1 == f2 = a1 == a2 && b1 == b2
        where   F a1 b1 = normaliza f1
                F a2 b2 = normaliza f2

-- (c) Defina Frac como instância da classe Ord.

instance Ord Frac where
    (<=) :: Frac -> Frac -> Bool
    f1 <= f2 = a1 * b2 <= a2 * b1
        where F a1 b1 = normaliza f1
              F a2 b2 = normaliza f2

{-
(d) Defina Frac como instância da classe Show, de forma a que cada fracção seja
apresentada por (numerador/denominador).
-}

instance Show Frac where
    show :: Frac -> String
    show f = show a ++ "/" ++ show b
        where F a b = normaliza f

{-
(e) Defina Frac como instância da classe Num. Relembre que a classe Num tem a
seguinte definição
class (Eq a, Show a) => Num a where
(+), (*), (-) :: a -> a -> a
negate, abs, signum :: a -> a
fromInteger :: Integer -> a
-}

instance Num Frac where
    (+) :: Frac -> Frac -> Frac
    (F a1 b1) + (F a2 b2) = normaliza ((F (a1*b2) (b1*b2)) + (F (a2*b1) (b1*b2)))

    (*) :: Frac -> Frac -> Frac
    (F a1 b1) * (F a2 b2) = normaliza (F (a1*a2) (b1*b2))

    (-) :: Frac -> Frac -> Frac
    (F a1 b1) - (F a2 b2) = normaliza ((F (a1*b2) (b1*b2)) - (F (a2*b1) (b1*b2)))

    negate :: Frac -> Frac 
    negate (F a1 b1) = (F (-a1) (-b1))
    
    abs :: Frac -> Frac 
    abs (F a1 b1) = ( F (abs(a1)) (abs(b1)) )

    signum :: Frac -> Frac
    signum (F a1 b1)
        | a1 * b1 > 0  = F (1) (1)      -- fração positiva
        | a1 * b1 < 0  = F (-1) (1)     -- fração negativa
        | otherwise    = F (0) (1)      -- fração nula


    fromInteger :: Interger -> Frac
    fromInteger x = (F (x) (1))
    
{-
(f) Defina uma função que, dada uma fracção f e uma lista de fracções l, selecciona
de l os elementos que são maiores do que o dobro de f.
-}

maioresQueDobro :: Frac -> [Frac] -> [Frac]
maioresQueDobro f l = filter (> (f * F 2 1)) l

-- exercicio 2
{-
Relembre o tipo definido na Ficha 7 para representar express˜oes inteiras. Uma poss´ıvel
generaliza¸c˜ao desse tipo de dados, ser´a considerar express˜oes cujas constantes s˜ao de
um qualquer tipo num´erico (i.e., da classe Num).
-}

data Exp a = Const a
           | Simetrico (Exp a)
           | Mais (Exp a) (Exp a)
           | Menos (Exp a) (Exp a)
           | Mult (Exp a) (Exp a)

-- (a) Declare Exp a como uma instˆancia de Show.

showExp :: Show a => Exp a -> String
showExp (Const a )      = show a
showExp (Simetrico a)   = "-" ++ (showExp a)
showExp (Mais a b)      = "(" ++ (showExp a) ++ "+" ++ (showExp b) ++ ")"
showExp (Menos a b)     = "(" ++ (showExp a) ++ "-" ++ (showExp b) ++ ")"
showExp (Mult a b)      = "(" ++ (showExp a) ++ "*" ++ (showExp b) ++ ")"

instance show a => snow(Exp a) where
    show = showExp

calcula :: Num a => Exp a -> a 
calcula (Const a)        = a
calcula (Simetrico a)    = - (calcula a)
calcula (Mais a b)       = calcula a + calcula b    
calcula (Menos a b)      = calcula a - calcula b
calcula (Mult a b)       = calcula a * calcula b    



-- (b) Declare Exp a como uma instˆancia de Eq.

eqExp :: Eq a => Exp a -> Exp a -> Bool
eqExp (Const a) (Const b)             = calcula a == calcula b

-- (c) Declare Exp a como instˆancia da classe Num.

numExp :: Num a 


{-
3. Relembre o exercı́cio da Ficha 3 sobre contas bancárias, com a seguinte declaração de
tipos
-}

data Movimento = Credito Float | Debito Float
data Data = D Int Int Int
data Extracto = Ext Float [(Data, String, Movimento)]

-- (a) Defina Data como instância da classe Ord.

instance Ord Data where                                   --(professora sofia)
    compare :: Data -> Data -> Ordering
    compare (D d1 m1 a1) (D d2 m2 a2) 
        | a1 > a2 || a1 == a2 && (m1 > m2 || m1 == m2 && d1 > d2) = GT
        | a1 == a2 && m1 == m2 && d1 == d2 = EQ
        | otherwise = LT

-- (b) Defina Data como instância da classe Show.

instance Show Data where
    show_data :: Data -> String
    show_data (D d m a) = show d ++ "/" ++ show m ++ "/" ++ show a 

{-
(c) Defina a função ordena :: Extracto -> Extracto, que transforma um ex-
tracto de modo a que a lista de movimentos apareça ordenada por ordem crescente
de data.
-}

-- codigo realizado pela professora sofia "https://pf.sofiars.xyz/fichas/8/" 
ordena :: Extracto -> Extracto
ordena (Ext n l) = Ext n (sortBy (\(data1,_,_) (data2,_,_) -> compare data1 data2) l)

{-
(d) Defina Extracto como instância da classe Show, de forma a que a apresentação do
extracto seja por ordem de data do movimento com o seguinte, e com o seguinte
aspecto
-}

-- codigo realizado pela professora sofia "https://pf.sofiars.xyz/fichas/8/" 

instance Show Extracto where
    show :: Extracto -> String
    show ext = "Saldo anterior: " ++ show n ++
               "\n---------------------------------------" ++
               "\nData       Descricao" ++ replicate (desc_max - 9) ' ' ++ "Credito" ++ replicate (cred_max - 7) ' ' ++ "Debito" ++
               "\n---------------------------------------\n" ++
               unlines (map (\(dat,desc,mov) -> 
                    show dat ++ replicate (data_max - length (show dat)) ' ' 
                    ++ map toUpper desc ++ replicate (desc_max - length desc) ' ' 
                    ++ case mov of Credito quant -> show quant ++ replicate (cred_max - length (show quant)) ' '; Debito _ -> replicate cred_max ' '
                    ++ case mov of Debito quant -> show quant; Credito _ -> ""
               ) movs) ++
               "---------------------------------------" ++
               "\nSaldo actual: " ++ show (saldo ext)
        where (Ext n movs) = ordena ext
              data_max = 11
              desc_max = max (length "Descricao   ") (maximum $ map (\(_,desc,_) -> length desc) movs)
              cred_max = max (length "Credito   ") (maximum $ map (\(_,_,mov) -> case mov of Credito x -> length (show x); _ -> 0) movs)