module Ficha9 where
import System.Random 

randomIO :: Random a => IO 
randomRIO :: Random a => (a,a) -> IO

dialogo :: String IO -> IO
diolog s =  do putStr s
            r <- getline
            return r 
{-
(a) bingo :: IO () que sorteia os n´umeros para o jogo do bingo. Sempre que uma
tecla ´e pressionada ´e apresentado um n´umero aleat´orio entre 1 e 90. Obviamente,
n˜ao podem ser apresentados n´umeros repetidos e o programa termina depois de
gerados os 90 n´umeros diferentes.
-}

{-
(b) mastermind :: IO () que implementa uma variante do jogo de descodifica¸c˜ao de
padr˜oes Mastermind. O programa deve come¸car por gerar uma sequˆencia secreta
de 4 d´ıgitos aleat´orios que o jogador vai tentar descodificar. Sempre que o jogador
introduz uma sequˆencia de 4 d´ıgitos, o programa responde com o n´umero de d´ıgitos
com o valor correcto na posi¸c˜ao correcta e com o n´umero de d´ıgitos com o valor
correcto na posi¸c˜ao errada. O jogo termina quando o jogador acertar na sequˆencia
de d´ıgitos secreta.
-}