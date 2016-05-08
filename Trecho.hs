-- Nome: Amanda Grams Jabroski e Anderson Gauterio

module Trecho where
import System.IO
import Data.Char(toUpper)

type Origem = String
type Destino = String
type Distancia = Double
type Valor = Double
type Trecho = [(Origem, Destino, Distancia, Valor)]
trechoViagem = [("Porto Alegre", "Florianopolis", 376.18, 188.09)
               ,("Porto Alegre", "Curitiba", 547.51, 273.76)
               ,("Porto Alegre", "São Paulo", 853.30, 426.65)
               ,("Porto Alegre", "Rio De Janeiro", 1127.20, 563.60)
               ,("Belo Horizonte", "Sao Paulo", 491.40, 245.70)
               ,("Belo Horizonte", "Rio De Janeiro", 342.40, 171.05)
               ,("Curitiba", "Rio De Janeiro", 679.52, 339.77)
               ,("Brasilia", "Belo Horizonte", 620.85, 310.43)
               ,("Rio De Janeiro", "São Paulo", 361.15, 180.58)]
 
-- 1. Retorne todos os destinos, distâncias e valores de uma cidade.
destinos :: Trecho -> Origem -> [ (Destino, Distancia, Valor)]
destinos trechoViagem n = [ (b,c,d) | (a,b,c,d) <-trechoViagem, a == n]
 
-- 2. Retorne todos as origens, distâncias e valores de uma cidade. 
origens :: Trecho -> Origem -> [ (Origem, Distancia, Valor)]
origens trechoViagem n = [ (a,c,d) | (a,b,c,d) <-trechoViagem,  b == n]
 
-- 3. Retorne todos os possíveis valores para um determinado roteiro.
custoRoteiro :: Trecho -> Origem -> Destino -> [Double]
custoRoteiro trechoViagem x y = [d | (a,b,c,d) <- trechoViagem, a == x && b == y  || a == y && b == x ]
 
-- 4. Verifique se um determinado roteiro de viagem pode ser realizado.
existeRoteiro :: Trecho -> Origem -> Destino -> Bool
existeRoteiro ((o1, d1, d, v):x) y z 
   | (o1 == y) && (d1 == z) = True 
   | x == [] = False
   | otherwise = existeRoteiro x y z

--5. Retorne o roteiro de menor distância entre uma origem e destino.
menorDistancia :: Trecho -> Origem -> Destino -> [Trecho] 
menorDistancia ((o1, d1, d, v):x) y z
   | x == [] && ((o1 == y) && (d1 == z)) = [(x)]
   | x == [] && ((o1 /= y) && (d1 /= z)) = [(x)]
   | ((o1 == y) && (d1 == z)) = [(o1, d1, d, v)] : menorDistancia x y z 
   | otherwise = menorDistancia x y z

-- 6 Insere e armazena um novo trecho de viagem. Deve ser verificado se já existe o mesmo 
-- trecho armazenado na lista de viagens. Caso já exista, o trecho deve atualizar a distância e o valor. 
-- Caso não exista, insere o novo trecho
insereTrecho :: Trecho ->Origem->Destino->Distancia->Valor->Trecho
insereTrecho z a b c d
    | z == [] = [(a,b,c,d)]
    | otherwise = z ++ [(a,b,c,d)]
 
-- Gravar trechos no Arquivo
 
escreveListaTrechos :: Trecho -> IO ()
escreveListaTrechos trecho = writeFile "trechos.txt" conteudo
  where
    conteudo = unlines (map mostraTrecho trecho)
    mostraTrecho (origem, destino, distancia, valor) = origem ++ "\t" ++ destino ++ "\t" ++ show distancia ++ "\t" ++ show valor ++ "\n" 
 
                
-- 7. Retira e armazena um trecho de viagem. 
removeTrecho :: Trecho->Origem->Destino->Trecho
removeTrecho ((origem,dest,dist,val):x)n m
                |(origem == n ) = x
                |(dest == m) = x
                | x == [] = x
                |otherwise = (origem,dest,dist,val) : removeTrecho x n m
 
-- 8. Retorna uma tabela mostrando todos os trechos, origens, destinos, distância e valor cadastrados na base de dados de trechos. OK
cabecalho::String
cabecalho = "Origem \tDestino \tDistancia (KM) \tValor (R$)\n"
 
listaTrechos :: Trecho->String
listaTrechos [] = " "
listaTrechos ((origem,destino,distancia,valor):x) = origem ++  "\t" ++ destino ++ "\t"++ show distancia ++ "\t" ++ show valor ++ "\n" ++ listaTrechos x
 
imprimeTrecho :: Trecho -> IO ()
imprimeTrecho l = putStr (cabecalho ++ listaTrechos l)
