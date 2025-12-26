module Ficha6 where
    
data BTree a = Empty
             | Node a (BTree a) (BTree a)
             deriving Show


-- exemplos de arvores binarias para testarem o vosso codigo --
-- 1. Árvore vazia
t1 :: BTree Int
t1 = Empty


-- 2. Árvore com apenas um nó
t2 :: BTree Int
t2 = Node 5 Empty Empty


-- 3. Árvore pequena e completa
t3 :: BTree Int
t3 = Node 1
        (Node 2 Empty Empty)
        (Node 3 Empty Empty)


-- 4. Árvore mais profunda à esquerda
t4 :: BTree Int
t4 = Node 10
        (Node 5
            (Node 2 Empty Empty)
            Empty)
        (Node 15 Empty Empty)


-- 5. Árvore não balanceada com vários níveis
t5 :: BTree Int
t5 = Node 8
        (Node 3
            (Node 1 Empty Empty)
            (Node 6
                (Node 4 Empty Empty)
                (Node 7 Empty Empty)))
        (Node 10
            Empty
            (Node 14
                (Node 13 Empty Empty)
                Empty))

t_stor :: BTree Int
t_stor = Node 7
            (Node 8
                (Node 5 Empty Empty)
                (Node 3 Empty Empty))
            (Node 12
                Empty
                (Node 4
                    (Node 1 Empty Empty)
                    Empty))

t_stor_procura :: BTree Int
t_stor_procura = Node 8
                    (Node 5
                        (Node 3 Empty Empty)
                        (Node 7 Empty Empty))
                    (Node 12
                        (Node 10 Empty Empty)
                        (Node 14 Empty Empty))
                        
-- | (a) altura :: BTree a -> Int que calcula a altura da ´arvore.

altura :: BTree a -> Int
altura (Empty)  = 0
altura (Node _ e d) = 1 + max (altura e) (altura d) 

-- | (b) contaNodos :: BTree a -> Int que calcula o n´umero de nodos da ´arvore.

contaNodos :: BTree a -> Int 
contaNodos Empty = 0
contaNodos (Node _ e d) = 1 + (contaNodos e) + (contaNodos d)

-- | (c) folhas :: BTree a -> Int, que calcula o n´umero de folhas (i.e., nodos sem descendentes) da ´arvore.

folhas :: BTree a -> Int
folhas Empty = 0
folhas (Node _ Empty Empty) = 1
folhas (Node _ e d) = (folhas e) + (folhas d) 

-- | (d) prune :: Int -> BTree a -> BTree a, que remove de uma ´arvore todos os elementos a partir de uma determinada profundidade.

prune :: Int -> BTree a -> BTree a
prune _ Empty = Empty 
prune 1 (Node r e d) = Node r Empty Empty
prune x (Node r e d) = Node r (prune (x-1) e) (prune (x-1) d)

{-
(e) path :: [Bool] -> BTree a -> [a], que dado um caminho (False corresponde
a esquerda e True a direita) e uma ´arvore, d´a a lista com a informa¸c˜ao dos nodos
por onde esse caminho passa.
-}

path :: [Bool] -> BTree a -> [a]
path _ Empty  = []
path [] (Node r _ _) = [r]
path (h:t) (Node r e d)
    | h == True = r : path t d
    | otherwise = r : path t e

-- | (f) mirror :: BTree a -> BTree a, que d´a a ´arvore sim´etrica.

mirror :: BTree a -> BTree a
mirror Empty = Empty
mirror (Node r e d) = Node r (mirror d) (mirror e)

-- | (g) zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c que generaliza a fun¸c˜ao zipWith para ´arvores bin´arias.

zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c
zipWithBT f (Node r1 e1 d1) (Node r2 e2 d2) =  
    Node (f r1 r2) 
         (zipWithBT f e1 e2) 
         (zipWithBT f d1 d2)
zipWithBT _ _ _ = Empty


{-
(h) unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c), que generaliza a
fun¸c˜ao unzip (neste caso de triplos) para ´arvores bin´arias.
-}

unzipBT :: BTree (a,b,c) -> (BTree a,BTree b,BTree c)
unzipBT = undefined





------------------------------- ARVORES BINÁRIAS DE PROCURA -------------------------------

-- | 2. Defina as seguintes fun¸c˜oes, assumindo agora que as ´arvores s˜ao bin´arias de procura:

{-
(a) Defina uma fun¸c˜ao minimo :: Ord a => BTree a -> a que determina o menor
elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}

minimo :: Ord a => BTree a -> a
minimo (Node r Empty _) = r
minimo (Node _ e _) = minimo e

{-
(b) Defina uma fun¸c˜ao semMinimo :: Ord a => BTree a -> BTree a que remove o
menor elemento de uma ´arvore bin´aria de procura n˜ao vazia.
-}

semMinimo :: Ord a => BTree a -> BTree a
semMinimo (Node _ Empty d) = d
semMinimo (Node _ e _) = semMinimo e


{-
(c) Defina uma fun¸c˜ao minSmin :: Ord a => BTree a -> (a,BTree a) que calcula,
com uma ´unica travessia da ´arvore o resultado das duas fun¸c˜oes anteriores.
-}

minSmin :: Ord a => BTree a -> (a,BTree a)
minSmin (Node r Empty d) = (x,d)
minSmin (Node r e d) = 
    let (m,e') = minSmin e
    in (m, Node x e' d)

{-
(d) Defina uma fun¸c˜ao remove :: Ord a => a -> BTree a -> BTree a que remove
um elemento de uma ´arvore bin´aria de procura, usando a fun¸c˜ao anterior.
-}

remove :: Ord a => a -> BTree a -> BTree a
remove _ Empty = Empty
remove x (Node r e d)
  | x < r     = Node r (remove x e) d
  | x > r     = Node r e (remove x d)
  | otherwise =
      case (e, d) of
        (Empty, _) -> d
        (_, Empty) -> e
        _          ->
          let m  = minimo d
              d' = semMinimo d
          in Node m e d'






{-
3. Considere agora que guardamos a informação sobre uma turma de alunos na seguinte estrutura de dados:
-}

type Aluno = (Numero,Nome,Regime,Classificacao)
type Numero = Int
type Nome = String
data Regime = ORD | TE | MEL deriving Show
data Classificacao = Aprov Int
                    | Rep
                    | Faltou
deriving Show
type Turma = BTree Aluno -- árvore binária de procura (ordenada por número)


a1, a2, a3, a4, a5 :: Aluno
a1 = (15, "Ana",   ORD, Aprov 14)
a2 = ( 7, "Bruno", TE,  Rep)
a3 = (20, "Carla", MEL, Faltou)
a4 = (10, "Duarte",ORD, Aprov 10)
a5 = ( 3, "Eva",   TE,  Aprov 18)

t0 :: Turma
t0 = Empty

t1 :: Turma
t1 = fromList [a1,a2,a3,a4,a5]


-- Defina as seguintes funções:

{-
(a) inscNum :: Numero -> Turma -> Bool, que verifica se um aluno, com um dado
número, está inscrito.
-}

inscNum :: Numero -> Turma -> Bool
inscNum _ Empty = False
inscNum x (Node (number,_,_,_) e d)
    | x > number        = inscNum x e
    | x < number        = inscNum x d
    | otherwise         = True

{-
(b) inscNome :: Nome -> Turma -> Bool, que verifica se um aluno, com um dado
nome, está inscrito.
-}

inscNome :: Nome -> Turma -> Bool
inscNome _ Empty = False
inscNome x (Node (_,name,_,_) e d)
    | x == name     = True
    | otherwise     = inscNome x e || inscNome x d

{-
(c) trabEst :: Turma -> [(Numero,Nome)], que lista o número e nome dos alunos
trabalhadores-estudantes (ordenados por número).
-}

trabEst :: Turma -> [(Numero,Nome)]
trabEst Empty = []
trabEst (Node (numero,nome,estatuto,_) e d)
    | estatuto == TE    = (numero,nome) : trabEst d ++ trabEst e
    | otherwise         = trabEst d ++ trabEst e

{-
(d) nota :: Numero -> Turma -> Maybe Classificacao, que calcula a classificação
de um aluno (se o aluno não estiver inscrito a função deve retornar Nothing).
-}

nota :: Numero -> Turma -> Maybe Classificacao
nota _ Empty = Nothing
nota x (Node (n,_,_,c) e d)
    | x < n         = nota x e
    | x > n         = nota x d
    | otherwise     = Just c
    
{-
(e) percFaltas :: Turma -> Float, que calcula a percentagem de alunos que fal-
taram à avaliação.
-}

percFaltas :: Turma -> Float 
percFaltas Empty = 0
percFaltas t = (faltasTotais t / numAlunos t) * 100
    where   faltasTotais :: Turma -> Float 
            faltasTotais Empty = 0
            faltasTotais (Node (_,_,_,Faltou) e d) = 1 + faltasTotais e + faltasTotais d
            faltasTotais (Node _ e d) = faltasTotais e + faltasTotais d
            numAlunos = fromIntegral . contaNodos



{-
(f) mediaAprov :: Turma -> Float, que calcula a média das notas dos alunos que
passaram.
-}

mediaAprov :: Turma -> Float
mediaAprov Empty = 0
mediaAprov turma = uncurry (/) (sumNumNotas turma)
    where sumNumNotas :: Turma -> (Float, Float)
          sumNumNotas Empty = (0,0)
          sumNumNotas (Node (_,_,_,Aprov nota) l r) = addPairs (fromIntegral nota, 1) (addPairs (sumNumNotas l) (sumNumNotas r))
          sumNumNotas (Node _ l r) = addPairs (sumNumNotas l) (sumNumNotas r)
          addPairs (a,b) (c,d) = (a+c,b+d)


{-
(g) aprovAv :: Turma -> Float, que calcula o rácio de alunos aprovados por avali-
ados. Implemente esta função fazendo apenas uma travessia da árvore.
-}

aprovAv :: Turma -> Float
aprovAv Empty = 0
aprovAv turma = uncurry (/) (sumAprovAv turma)
          
sumAprovAv :: Turma -> (Float, Float)
sumAprovAv Empty = (0,0)
sumAprovAv (Node (_,_,_,clas) l r) = 
    case clas of Aprov 
        nota    -> (ap+1,av+1) 
        Rep     -> (ap,av+1)
        _       -> (ap,av)
    where (ap,av) = addPairs (sumAprovAv l) (sumAprovAv r)
          addPairs (a,b) (c,d) = (a+c,b+d)