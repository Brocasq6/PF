module Ficha9 where

dialogo :: String -> IO String
dialogo s = do
    putStr s
    getLine


-- calcula a funcao fibonacci de um nº de lido do teclado

fib :: Int -> Int
fib 0 = 0 
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

fibonacci :: IO ()
fibonacci = do
    n <- dialogo "Introduz o número de Fibonacci que queres calcular: "
    let r = fib (read n)
    putStrLn ("O resultado é " ++ show r)

calculaFib :: IO()
calculaFib = do 
    n <- dialogo "Introduz o número de Fibonacci que queres calcular: "
    i <- read n
    if i < 0 then putStrLn "o Fib nao se encontra definido para valores menores que zero"
    else do 
        r <- fib i
        putStrLn "o fib de " ++ n ++ "é" ++ show i 
    




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