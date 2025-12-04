module Ficha9 where

--------------------------------------- "funcoes de Introducao aos IO'S do professor Saraiva" ---------------------------------------

dialogo :: String -> IO String
dialogo s = do
    putStr s
    getLine


-- calcula a funcao fibonacci de um nº de lido do teclado

fib_normal :: Int -> Int
fib_normal 0 = 0 
fib_normal 1 = 1
fib_normal n = fib(n-1) + fib(n-2)

fib_IO :: IO ()
fib_IO = do
    n <- dialogo "Introduz o número de Fibonacci que queres calcular: "
    let r = fib_normal (read n)
    putStrLn ("O resultado é " ++ show r)

fib_negativos :: IO ()
fib_negativos = do
    n <- dialogo "Introduz o número de Fibonacci que queres calcular: "
    let i = read n
    if i < 0
        then putStrLn "O Fib não se encontra definido para valores menores que zero"
        else do
            let r = fib_normal i
            putStrLn ("O Fib de " ++ n ++ " é " ++ show r)
    

------------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------- FICHA 9 ---------------------------------------

{-
(a) bingo :: IO () que sorteia os n´umeros para o jogo do bingo. Sempre que uma
tecla ´e pressionada ´e apresentado um n´umero aleat´orio entre 1 e 90. Obviamente,
n˜ao podem ser apresentados n´umeros repetidos e o programa termina depois de
gerados os 90 n´umeros diferentes.
-}

bingo :: IO() 
bingo = do

{-
(b) mastermind :: IO () que implementa uma variante do jogo de descodifica¸c˜ao de
padr˜oes Mastermind. O programa deve come¸car por gerar uma sequˆencia secreta
de 4 d´ıgitos aleat´orios que o jogador vai tentar descodificar. Sempre que o jogador
introduz uma sequˆencia de 4 d´ıgitos, o programa responde com o n´umero de d´ıgitos
com o valor correcto na posi¸c˜ao correcta e com o n´umero de d´ıgitos com o valor
correcto na posi¸c˜ao errada. O jogo termina quando o jogador acertar na sequˆencia
de d´ıgitos secreta.
-}