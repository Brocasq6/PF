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
normaliza = undefined


mdc :: Integer -> Integer -> Integer
mdc = undefined


-- (b) Defina Frac como instância da classe Eq.

instance Eq Frac where
    (==) :: Frac -> Frac -> Bool
    (==) = undefined


-- (c) Defina Frac como instância da classe Ord.

instance Ord Frac where
    (<=) :: Frac -> Frac -> Bool
    (<=) = undefined

{-
(d) Defina Frac como instância da classe Show, de forma a que cada fracção seja
apresentada por (numerador/denominador).
-}

instance Show Frac where
    show :: Frac -> String
    show = undefined


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
    (+) = undefined

    (*) :: Frac -> Frac -> Frac
    (*) = undefined

    (-) :: Frac -> Frac -> Frac
    (-) = undefined

    negate :: Frac -> Frac 
    negate = undefined
    
    abs :: Frac -> Frac 
    abs = undefined

    signum :: Frac -> Frac
    signum = undefined

    fromInteger :: Interger -> Frac
    fromInteger = undefined
    
{-
(f) Defina uma função que, dada uma fracção f e uma lista de fracções l, selecciona
de l os elementos que são maiores do que o dobro de f.
-}

maioresQueDobro :: Frac -> [Frac] -> [Frac]
maioresQueDobro = undefined


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
showExp = undefined


instance show a => snow(Exp a) where
    show = showExp

calcula :: Num a => Exp a -> a 
calcula = undefined




-- (b) Declare Exp a como uma instˆancia de Eq.

eqExp :: Eq a => Exp a -> Exp a -> Bool
eqExp (Const a) (Const b)             = calcula a == calcula b

-- (c) Declare Exp a como instˆancia da classe Num.

numExp :: Num a 
numExp = undefined


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
