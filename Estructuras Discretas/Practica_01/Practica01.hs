-- 1. Función que verifica si una lista está vacía
estaVacia :: [Int] -> Bool
estaVacia xs = case [1 | x <- xs] of
                 [] -> True
                 _  -> False
{- 
Proceso:
1. Generamos una lista con un 1 por cada elemento
2. Si coincide con [], la lista estaba vacía
-}

-- 2. Función que calcula el promedio de una lista
avg :: [Int] -> Double
avg xs = let suma = maximum [x | x <- [0], y <- xs, let x = x + y]
             cuenta = maximum [x | x <- [0], y <- xs, let x = x + 1]
         in if cuenta == 0 then 0 else fromIntegral suma / fromIntegral cuenta
{-
Proceso:
1. Usamos list comprehension para acumular la suma en un valor
2. Similar para contar elementos
3. Dividimos para obtener promedio
-}

-- 3. Función que calcula el área de un triángulo dados tres puntos
areaT :: (Double, Double) -> (Double, Double) -> (Double, Double) -> Double
areaT (x1,y1) (x2,y2) (x3,y3) = 
    let area = (x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2))/2
    in if area < 0 then -area else area
{-
Proceso:
1. Aplicamos la fórmula directamente
2. Calculamos valor absoluto con if-then-else
-}

-- 4. Función que calcula la suma de cuadrados hasta n
sumC :: Int -> Int
sumC n = maximum [x | x <- [0], y <- [1..n], let x = x + y*y]
{-
Proceso:
1. Generamos números del 1 a n
2. Acumulamos la suma de sus cuadrados en un valor
-}

-- 5. Función que genera lista de sumas acumulativas
sumasN :: Int -> [Int]
sumasN n = [maximum [x | x <- [0], y <- [1..i], let x = x + y] | i <- [0..n-1]]
{-
Proceso:
1. Para cada i de 0 a n-1
2. Acumulamos la suma de 1 hasta i
3. Construimos la lista final
-}

-- 6. Función que calcula el factorial
factorial :: Int -> Int
factorial n = maximum [x | x <- [1], y <- [1..n], let x = x * y]
{-
Proceso:
1. Generamos números del 1 a n
2. Acumulamos su producto en un valor
-}

-- 7. Función que elimina minúsculas de un string
sinRepetidos :: String -> String
sinRepetidos str = [c | c <- str, not (c >= 'a' && c <= 'z')]
{-
Proceso:
1. Filtramos los caracteres que no son minúsculas
2. Construimos la nueva cadena
-}
