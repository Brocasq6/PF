module C50_Q where

{-
1  Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) enumFromTo :: Int -> Int ->
[Int] que constr´oi a lista dos n´umeros inteiros compreendidos entre dois limites.
Por exemplo, enumFromTo 1 5 corresponde `a lista [1,2,3,4,5]) 
-}

enomFromTo :: Int -> Int -> [Int]
enomFromTo n1 n2
    | n1 > n2 = []
    | otherwise = n1 : enomFromTo (n1 + 1) (n2)

{-
2 Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) enumFromThenTo :: Int -> Int
-> Int -> [Int] que constr´oi a lista dos n´umeros inteiros compreendidos entre dois limites
e espa¸cados de um valor constante.
Por exemplo, enumFromThenTo 1 3 10 corresponde `a lista [1,3,5,7,9].)
-}

enumFromThenTo2 :: Int -> Int -> Int -> [Int]
enumFromThenTo2 n1 n2 n3 
    | n1 > n3   = [] 
    | otherwise = n1 : enumFromThenTo2 n2 (n2 + (n2 - n1)) n3 

{-
3. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) (++) :: [a] -> [a] -> [a]
que concatena duas listas.
Por exemplo, (++) [1,2,3] [10,20,30] corresponde `a lista [1,2,3,10,20,30].
-}

(+++) :: [a] -> [a] -> [a]
(+++) [] [] = []
(+++) [] l = l
(+++) (h:t) l2 = h : (+++) t l2

{-
4. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) (!!) :: [a] -> Int -> a que
dada uma lista e um inteiro, calcula o elemento da lista que se encontra nessa posi¸c˜ao (assumese que o primeiro elemento se encontra na posi¸c˜ao 0).
Por exemplo, (!!) [10,20,30] 1 corresponde a 20.
Ignore os casos em que a fun¸c˜ao n˜ao se encontra definida (i.e., em que a posi¸c˜ao fornecida n˜ao
corresponde a nenhuma posi¸c˜ao v´alida da lista).
-}

(!!!) :: [a] -> Int -> a 
(!!!) (h:t) x
    | x == 0 = h
    | otherwise = (!!!) t (x - 1)

{-
5. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) reverse :: [a] -> [a] que
dada uma lista calcula uma lista com os elementos dessa lista pela ordem inversa.
Por exemplo, reverse [10,20,30] corresponde a [30,20,10].
-}

reverseBini :: [a] -> [a]
reverseBini l = 
    case l of
        []      -> []
        (h:t)   -> reverseBini t ++ [h] 

{-
6. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) take :: Int -> [a] -> [a] que
dado um inteiro n e uma lista l calcula a lista com os (no m´aximo) n primeiros elementos de
l.
A lista resultado s´o ter´a menos de que n elementos se a lista l tiver menos do que n elementos.
Nesse caso a lista calculada ´e igual `a lista fornecida.
Por exemplo, take 2 [10,20,30] corresponde a [10,20].
-}

takeBini :: Int -> [a] -> [a]
takeBini x [] = []
takeBini x (h:t)
    | x == 0 = t
    | otherwise = h : takeBini (x - 1) t

{-
7. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) drop :: Int -> [a] -> [a] que
dado um inteiro n e uma lista l calcula a lista sem os (no m´aximo) n primeiros elementos de
l.
Se a lista fornecida tiver n elementos ou menos, a lista resultante ser´a vazia.
Por exemplo, drop 2 [10,20,30] corresponde a [30].
-}

dropBini :: Int -> [a] -> [a]
dropBini x [] = []
dropBini x (h:t)
    | x == 0 = t
    | otherwise = h : drop (x-1) t 



{-
8. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) zip :: [a] -> [b] -> [(a,b)]
const´oi uma lista de pares a partir de duas listas.
Por exemplo, zip [1,2,3] [10,20,30,40] corresponde a [(1,10),(2,20),(3,30)].
-}

zipBini :: [a] -> [b] -> [(a,b)]
zipBini [] [] = []
zipBini [] _ = []
zipBini (h1:t1) (h2:t2) = (h1,h2) : zipBini t1 t2

{-
9. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) replicate :: Int -> a ->
[a] que dado um inteiro n e um elemento x const´oi uma lista com n elementos, todos iguais
a x.
Por exemplo, replicate 3 10 corresponde a [10,10,10].
-}

replicateBini :: Int -> a -> [a]
replicateBini v r
    | v == 0 = []
    | otherwise = r : replicateBini (v - 1) r

{-
10. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) intersperse :: a -> [a] ->
[a] que dado um elemento e uma lista, constr´oi uma lista em que o elemento fornecido ´e
intercalado entre os elementos da lista fornecida.
Por exemplo, intersperce 1 [10,20,30] corresponde a [10,1,20,1,30].
-}

intersperceBini :: a -> [a] -> [a]
intersperceBini x l = 
    case l of
        []      -> []
        [x]     -> [x] 
        (h:t)   -> h : x : intersperceBini x t

{-
11. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) group :: Eq a => [a] -> [[a]] que
agrupa elementos iguais e consecutivos de uma lista.
Por exemplo, group [1,2,2,3,4,4,4,5,4] corresponde a [[1],[2,2],[3],[4,4,4],[5],[4]].
-}

groupBiniOriginal :: Eq a => [a] -> [[a]]
groupBiniOriginal [] = []
groupBiniOriginal [x] = [[x]]
groupBiniOriginal (h:t) = insereBini h (groupBiniOriginal t) -- agrupa primeiro o resto da lista e so depois e que agrupa h

groupBini2 :: Eq a => [a] -> [[a]]
groupBini2 []   = []
groupBini2 [x]  = [[x]]
groupBini2 (x:y:ys)
    | x == y    = (x : head (groupBini2 (y:ys))) : tail (groupBini2 (y:ys))
    | otherwise = [x] : (groupBini2 (y:ys))

insereBini :: Eq a => a -> [[a]] -> [[a]]
insereBini x [] = [[x]]
insereBini x (h:t)
    | elem x h  = (x : h) : t
    | otherwise = [x] : (h : t)
{-
12. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) concat :: [[a]] -> [a] que
concatena as listas de uma lista.
Por exemplo, concat [[1],[2,2],[3],[4,4,4],[5],[4]] corresponde a [1,2,2,3,4,4,4,5,4].
-}

concatBini :: [[a]] -> [a]
concatBini l =
    case l of 
        []      -> []
        (h:t)   -> h ++ concatBini t

{-
13. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) inits :: [a] -> [[a]] que
calcula a lista dos prefixos de uma lista.
Por exemplo, inits [11,21,13] corresponde a [[],[11],[11,21],[11,21,13]].
-}

-- nesta funcao e necessario recorrer á funcao init 
-- init [1,2,3,4] retorna [1,2,3]  

initsBini :: [a] -> [[a]]
initsBini l =
    case l of 
        [] -> [[]]
        l  -> initsBini (init l) ++ [l]

{-
14. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) tails :: [a] -> [[a]] que
calcula a lista dos sufixos de uma lista.
Por exemplo, tails [1,2,3] corresponde a [[1,2,3],[2,3],[3],[]].
-}

tailsBini :: [a] -> [[a]]
tailsBini l = 
    case l of 
        []      -> [[]] 
        (h:t)   -> reverseBini(initsBini (h:t))

{-
15. Defina a fun¸c˜ao heads :: [[a]] -> [a] que recebe uma lista de listas e produz a lista com
o primeiro elemento de cada lista.
Por exemplo, heads [[2,3,4],[1,7],[],[8,5,3]] corresponde a [2,1,8].
-}

headsBini :: [[a]] -> [a]
headsBini l =
    case l of 
        [[]]    -> []
        ([]:t)  -> headsBini t
        (h:t)   -> head h : headsBini t     

{-
16. Defina a fun¸c˜ao total :: [[a]] -> Int que recebe uma lista de listas e conta o total de
elementos (de todas as listas)
Por exemplo, total [[2,3,4],[1,7],[],[8,5,3]] corresponde a 8.
-}

lengthBini :: [a] -> Int
lengthBini l = 
    case l of 
        [] -> 0 
        (h:t) -> 1 + lengthBini t

totalBini :: [[a]] -> Int
totalBini l =
    case l of 
        []      -> 0 
        [[]]    -> 0
        (h:t)   -> lengthBini h + totalBini t
{-
17. Defina a fun¸c˜ao fun :: [(a,b,c)] -> [(a,c)] que recebe uma lista de triplos e produz a
lista de pares com o primeiro e o terceiro elemento de cada triplo.
Por exemplo, fun [("rui",3,2), ("maria",5,2), ("ana",43,7)] corresponde a
[("rui",2), ("maria",2), ("ana",7)].
-}

funBini :: [(a,b,c)] -> [(a,c)]
funBini l =
    case l of 
        [] -> []
        [(a,b,c)] -> [(a,c)]
        ((a,b,c):t) -> (a,c) : funBini t 

{-
18. Defina a fun¸c˜ao cola :: [(String,b,c)] -> String que recebe uma lista de triplos e concatena as strings que est˜ao na primeira componente dos triplos.
Por exemplo, cola [("rui",3,2), ("maria",5,2), ("ana",43,7)] corresponde a "ruimariaana
-}

colaBini :: [(String,b,c)] -> String
colaBini l =
    case l of
        []            -> "nao tem nada" 
        [(str,b,c)]   -> str
        ((str,b,c):t) -> str ++ colaBini t 

{-
19. Defina a fun¸c˜ao idade :: Int -> Int -> [(String,Int)] -> [String] que recebe o ano,
a idade e uma lista de pares com o nome e o ano de nascimento de cada pessoa, e devolve a
listas de nomes das pessoas que nesse ano atingir˜ao ou j´a ultrapassaram a idade indicada.
Por exemplo, idade 2021 26 [("rui",1995), ("maria",2009), ("ana",1947)] corresponde
a ["rui","ana"].
-}

idadeBini :: Int -> Int -> [(String,Int)] -> [String]
idadeBini a i l = 
    case l of 
        []        -> []
        ((np,an):t) -> if a - an >= i then np : idadeBini a i t else idadeBini a i t

{-
20. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao, 
powerEnumFrom :: Int -> Int -> [Int]
que dado um valor n e um valor m constr´oi a lista [n0, . . . , nm−1].
-}

powerEnumFrom :: Int -> Int -> [Int]
powerEnumFrom n 1 = [1]
powerEnumFrom n m 
    | m > 1 = powerEnumFrom n (m-1) ++ [n^(m-1)]
    | otherwise = []

{-
21. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao,
isPrime :: Int -> Bool
que dado um n´umero inteiro maior ou igual a 2 determina se esse n´umero ´e primo. Para
determinar se um n´umero n ´e primo, descubra se existe algum n´umero inteiro m tal que
2 ≤ m ≤√n e mod n m = 0. Se um tal n´umero n˜ao existir ent˜ao n ´e primo, e se existir ent˜ao n
n˜ao ´e primo.
-}

isPrime :: Int -> Bool
isPrime n 
    | n >= 2    = primeCheckSofia n 2
    | otherwise = False

primeCheckSofia :: Int -> Int -> Bool
primeCheckSofia n m
    | m * m > n     = True
    | mod n m == 0  = False
    | otherwise     = primeCheckSofia n (m + 1)

{-
22. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) isPrefixOf :: Eq a => [a] -> [a] -> Bool que testa se uma lista ´e prefixo de outra.
Por exemplo, isPrefixOf [10,20] [10,20,30] corresponde a True enquanto que isPrefixOf
[10,30] [10,20,30] corresponde a False.
-}

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf _ [] = False
isPrefixOf [] _ = True
isPrefixOf (h1:t1) (h2:t2)
    | h1 == h2 && isPrefixOf t1 t2 = True
    | otherwise = False
{-
23. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) isSuffixOf :: Eq a => [a] -> [a] -> Bool que testa se uma lista ´e sufixo de outra.
Por exemplo, isSuffixOf [20,30] [10,20,30] corresponde a True enquanto que isSuffixOf
[10,30] [10,20,30] corresponde a False.
-}

isSuffixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf _ [] = False
isSuffixOf [] _ =    

{-
24. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) isSubsequenceOf :: Eq a => [a] -> [a] -> Bool que testa se os elementos de uma lista ocorrem noutra pela mesma
ordem relativa.
Por exemplo, isSubsequenceOf [20,40] [10,20,30,40] corresponde a True enquanto que
isSubsequenceOf [40,20] [10,20,30,40] corresponde a False.
-}

subsequenceOfBini :: Eq a => [a] -> [a] -> Bool
subsequenceOfBini = undefined

{-
25. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) elemIndices :: Eq a => a ->
[a] -> [Int] que calcula a lista de posi¸c˜oes em que um dado elemento ocorre numa lista.
Por exemplo, elemIndices 3 [1,2,3,4,3,2,3,4,5] corresponde a [2,4,6].
-}

elemIndicesBini :: Eq a => a -> [a] -> [Int]
elemIndicesBini = undefined

{-
26. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) nub :: Eq a => [a] -> [a] que
calcula uma lista com os mesmos elementos da recebida, sem repeti¸c˜oes.
Por exemplo, nub [1,2,1,2,3,1,2] corresponde a [1,2,3].
-}

nubBini :: Eq a => [a] -> [a]
nubBini = undefined

{-
27. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) delete :: Eq a => a -> [a]
-> [a] que retorna a lista resultante de remover (a primeira ocorrˆencia de) um dado elemento
de uma lista.
Por exemplo, delete 2 [1,2,1,2,3,1,2] corresponde a [1,1,2,3,1,2]. Se n˜ao existir nenhuma ocorrˆencia a fun¸c˜ao dever´a retornar a lista recebida.
-}

deleteBini :: Eq a => a -> [a] -> [a]
deleteBini = undefined

{-
28. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) (\\):: Eq a => [a] -> [a]
-> [a] que retorna a lista resultante de remover (as primeiras ocorrˆencias) dos elementos da
segunda lista da primeira.
Por exemplo, (\\)[1,2,3,4,5,1] [1,5] corresponde a [2,3,4,1].
-}

(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) = undefined

{-
29. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) union :: Eq a => [a] -> [a]
-> [a] que retorna a lista resultante de acrescentar `a primeira lista os elementos da segunda
que n˜ao ocorrem na primeira.
Por exemplo, union [1,1,2,3,4] [1,5] corresponde a [1,1,2,3,4,5].
-}

unionBini :: Eq a => [a] -> [a] -> [a]
unionBini = undefined

{-
30. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) intersect :: Eq a => [a] ->
[a] -> [a] que retorna a lista resultante de remover da primeira lista os elementos que n˜ao
pertencem `a segunda.
Por exemplo, intersect [1,1,2,3,4] [1,3,5] corresponde a [1,1,3].
-}

intersectBini :: Eq a => [a] -> [a] -> [a]
intersectBini = undefined

{-
31. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) insert :: Ord a => a -> [a]
-> [a] que dado um elemento e uma lista ordenada retorna a lista resultante de inserir
ordenadamente esse elemento na lista.
Por exemplo, insert 25 [1,20,30,40] corresponde a [1,20,25,30,40].
-}

insertBini :: Ord a => a -> [a] -> [a]
insertBini = undefined

{-
32. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) unwords :: [String] -> String que
junta todas as strings da lista numa s´o, separando-as por um espa¸co.
Por exemplo, unwords ["Programacao", "Funcional"] corresponde a "Programacao Funcional".
-}

unwordsBini :: [String] -> String
unwordsBini = undefined

{-
33. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) unlines :: [String] -> String que
junta todas as strings da lista numa s´o, separando-as pelo caracter ’\n’.
Por exemplo, unlines ["Prog", "Func"] corresponde a "Prog\nFunc\n".
-}

unlinesBini :: [String] -> String
unlinesBini = undefined

{-
34. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao pMaior :: Ord a => [a] -> Int que dada
uma lista n˜ao vazia, retorna a posi¸c˜ao onde se encontra o maior elemento da lista. As posi¸c˜oes
da lista come¸cam em 0, i.e., a fun¸c˜ao dever´a retornar 0 se o primeiro elemento da lista for o
maior.
-}

pMaior :: Ord a => [a] -> Int
pMaior = undefined

{-
35. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao (pr´e-definida) lookup :: Eq a => a -> [(a,b)]
-> Maybe b que retorna uma lista constru´ıda a partir de elementos de uma lista (o segundo
argumento) atendendo a uma condi¸c˜ao dada pelo primeiro argumento.
Por exemplo, lookup ’a’ [(’a’,1),(’b’,4),(’c’,5)] corresponde `a lista Just 1.
-}

lookupBini :: Eq a => a -> [(a,b)] -> Maybe b
lookupBini = undefined

{-
36. Defina a fun¸c˜ao preCrescente :: Ord a => [a] -> [a] calcula o maior prefixo crescente
de uma lista.
Por exemplo, preCrescente [3,7,9,6,10,22] corresponde a [3,7,9].
-}

preCrescente :: Ord a => [a] -> [a]
preCrescente = undefined

{-
37. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao iSort :: Ord a => [a] -> [a] que calcula
o resultado de ordenar uma lista. Assuma, se precisar, que existe definida a fun¸c˜ao insert
:: Ord a => a -> [a] -> [a] que dado um elemento e uma lista ordenada retorna a lista
resultante de inserir ordenadamente esse elemento na lista.
-}

iSort :: Ord a => [a] -> [a]
iSort = undefined

{-
38. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao menor :: String -> String -> Bool que
dadas duas strings, retorna True se e s´o se a primeira for menor do que a segunda, segundo
a ordem lexicogr´afica (i.e., do dicion´ario)
Por exemplo, menor "sai" "saiu" corresponde a True enquanto que menor "programacao"
"funcional" corresponde a False.
-}

menor :: String
menor = undefined

{-
39. Considere que se usa o tipo [(a,Int)] para representar multi-conjuntos de elementos de a.
Considere ainda que nestas listas n˜ao h´a pares cuja primeira componente coincida, nem cuja
segunda componente seja menor ou igual a zero.
Defina a fun¸c˜ao elemMSet :: Eq a => a -> [(a,Int)] -> Bool que testa se um elemento
pertence a um multi-conjunto.
Por exemplo, elemMSet ’a’ [(’b’,2), (’a’,4), (’c’,1)] corresponde a True enquanto
que elemMSet ’d’ [(’b’,2), (’a’,4), (’c’,1)] corresponde a False.
-}

elemMSet :: Eq a => a -> [(a,Int)] -> Bool
elemMSet = undefined

{-
40. Considere que se usa o tipo [(a,Int)] para representar multi-conjuntos de elementos de a.
Considere ainda que nestas listas n˜ao h´a pares cuja primeira componente coincida, nem cuja
segunda componente seja menor ou igual a zero.
Defina a fun¸c˜ao converteMSet :: [(a,Int)] -> [a] que converte um multi-conjuto na
lista dos seus elementos
Por exemplo, converteMSet [(’b’,2), (’a’,4), (’c’,1)] corresponde a "bbaaaac".
-}

converteMSet :: [(a,Int)] -> [a]    
converteMSet = undefined

{-
41. Considere que se usa o tipo [(a,Int)] para representar multi-conjuntos de elementos de a.
Considere ainda que nestas listas n˜ao h´a pares cuja primeira componente coincida, nem cuja
segunda componente seja menor ou igual a zero.
Defina a fun¸c˜ao insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)] que acrescenta
um elemento a um multi-conjunto.
Por exemplo, insereMSet ’c’ [(’b’,2), (’a’,4), (’c’,1)] corresponde a [(’b’,2),
(’a’,4), (’c’,2)].
-}

insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet = undefined

{-
42. Considere que se usa o tipo [(a,Int)] para representar multi-conjuntos de elementos de a.
Considere ainda que nestas listas n˜ao h´a pares cuja primeira componente coincida, nem cuja
segunda componente seja menor ou igual a zero.
Defina a fun¸c˜ao removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)] que remove um
elemento a um multi-conjunto. Se o elemento n˜ao existir, deve ser retornado o multi-conjunto
recebido.
Por exemplo, removeMSet ’c’ [(’b’,2), (’a’,4), (’c’,1)] corresponde a [(’b’,2),
(’a’,4)].
-}

removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet = undefined

{-
43. Considere que se usa o tipo [(a,Int)] para representar multi-conjuntos de elementos de a.
Considere ainda que nestas listas n˜ao h´a pares cuja primeira componente coincida, nem cuja
segunda componente seja menor ou igual a zero.
-}

cardMSet :: [(a,Int)] -> Int
cardMSet = undefined

{-
44. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao pr´e-definida partitionEithers :: [Either
a b] -> ([a],[b]) que divide uma lista de Either s em duas listas.
-}

partitionEithers :: [Either a b] -> ([a],[b])
partitionEithers = undefined

{-
45. Apresente uma defini¸c˜ao recursiva da fun¸c˜ao pr´e-definida catMaybes :: [Maybe a] -> [a]
que colecciona os elementos do tipo a de uma lista.
-}

catMaybes :: [Maybe a] -> [a]
catMaybes = undefined

{-
46. Considere o seguinte tipo para representar movimentos de um robot.
data Movimento = Norte | Sul | Este | Oeste
deriving Show
Defina a fun¸c˜ao caminho :: (Int,Int) -> (Int,Int) -> [Movimento] que, dadas as posi¸c˜oes
inicial e final (coordenadas) do robot, produz uma lista de movimentos suficientes para que o
robot passe de uma posi¸c˜ao para a outra.
-}
data Movimento 
    = Norte 
    | Sul 
    | Este 
    | Oeste
    deriving Show

caminho :: (Int,Int) -> (Int,Int) -> [Movimento]
caminho = undefined

{-
47. Consider o seguinte tipo de dados,
data Movimento = Norte | Sul | Este | Oeste
deriving Show
Defina a fun¸c˜ao hasLoops :: (Int,Int) -> [Movimento] -> Bool que dada uma posi¸c˜ao
inicial e uma lista de movimentos (correspondentes a um percurso) verifica se o robot alguma
vez volta a passar pela posi¸c˜ao inicial ao longo do percurso correspondente. Pode usar a
fun¸c˜ao posicao definida acima.
-}

hasLoops :: (Int,Int) -> [Movimento] -> Bool
hasLoops = undefined

{-
48. Considere os seguintes tipos para representar pontos e rectˆangulos, respectivamente. Assuma
que os rectˆangulos tˆem os lados paralelos aos eixos e s˜ao representados apenas por dois dos
pontos mais afastados.
type Ponto = (Float,Float)
data Rectangulo = Rect Ponto Ponto
Defina a fun¸c˜ao contaQuadrados :: [Rectangulo] -> Int que, dada uma lista com rectˆangulos,
conta quantos deles s˜ao quadrados.
-}

type Ponto = (Float,Float)  
data Rectangulo = Rect Ponto Ponto
    deriving Show

contaQuadrados :: [Rectangulo] -> Int
contaQuadrados = undefined

{-
49. Considere os seguintes tipos para representar pontos e rectˆangulos, respectivamente. Assuma
que os rectˆangulos tˆem os lados paralelos aos eixos e s˜ao representados apenas por dois dos
pontos mais afastados.
type Ponto = (Float,Float)
data Rectangulo = Rect Ponto Ponto
Defini a fun¸c˜ao areaTotal :: [Rectangulo] -> Float que, dada uma lista com rectˆangulos,
determina a ´area total que eles ocupam.
-}

areaTotal :: [Rectangulo] -> Float  
areaTotal = undefined

{-
50. Considere o seguinte tipo para representar o estado de um equipamento.
data Equipamento = Bom | Razoavel | Avariado
deriving Show
Defina a fun¸c˜ao naoReparar :: [Equipamento] -> Int que determina a quantidade de
equipamentos que n˜ao est˜ao avariados.
-}

data Equipamento 
    = Bom 
    | Razoavel 
    | Avariado
    deriving Show

naoReparar :: [Equipamento] -> Int
naoReparar = undefined




