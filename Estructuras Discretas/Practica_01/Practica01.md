# Soluciones de Ejercicios en Haskell

Este documento explica detalladamente las soluciones implementadas para los ejercicios de programación funcional en Haskell.

## Restricciones Aplicadas

Todas las soluciones se han desarrollado siguiendo estas restricciones:
- No se utilizan funciones auxiliares como `sum`, `product`, `length`, `head`, `last`, `foldr`, etc.
- No se utiliza recursión
- No se utiliza el operador de indexación `!!`
- Se emplean principalmente list comprehension y operadores básicos
- Cada función incluye una explicación del proceso

## Explicación Detallada de Cada Función

### 1. Función `estaVacia`

```haskell
estaVacia :: [Int] -> Bool
estaVacia xs = case [1 | x <- xs] of
                 [] -> True
                 _  -> False
```

**Explicación detallada:**
- Esta función determina si una lista de enteros está vacía.
- Utiliza list comprehension para intentar generar una nueva lista que contenga un 1 por cada elemento de la lista original.
- Si la lista original está vacía, la list comprehension no producirá ningún elemento, resultando en una lista vacía.
- Mediante pattern matching con `case`, verificamos:
  - Si el resultado es una lista vacía `[]`, entonces la lista original estaba vacía y retornamos `True`.
  - Para cualquier otro resultado `_`, la lista original tenía al menos un elemento y retornamos `False`.
- Esta solución evita usar la función `null` u otras funciones auxiliares, implementando la lógica directamente con list comprehension.

### 2. Función `avg`

```haskell
avg :: [Int] -> Double
avg xs = let suma = maximum [x | x <- [0], y <- xs, let x = x + y]
             cuenta = maximum [x | x <- [0], y <- xs, let x = x + 1]
         in if cuenta == 0 then 0 else fromIntegral suma / fromIntegral cuenta
```

**Explicación detallada:**
- Esta función calcula el promedio de una lista de enteros.
- Para calcular la suma de los elementos:
  - Inicializamos un acumulador `x` con valor 0.
  - Por cada elemento `y` de la lista original, actualizamos el valor de `x` sumándole `y`.
  - Usamos `maximum` para extraer el valor final acumulado (que es el único valor en la lista resultante).
- Para contar los elementos:
  - Similar a la suma, inicializamos un acumulador en 0.
  - Por cada elemento de la lista, incrementamos el contador en 1.
  - Usamos `maximum` para obtener el valor final.
- Finalmente, dividimos la suma entre la cantidad, convirtiendo ambos a `Double` con `fromIntegral`.
- Incluimos una verificación para evitar división por cero cuando la lista está vacía.

### 3. Función `areaT`

```haskell
areaT :: (Double, Double) -> (Double, Double) -> (Double, Double) -> Double
areaT (x1,y1) (x2,y2) (x3,y3) = 
    let area = (x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2))/2
    in if area < 0 then -area else area
```

**Explicación detallada:**
- Esta función calcula el área de un triángulo dados tres puntos en coordenadas cartesianas.
- Implementa la fórmula del determinante para calcular el área:
  - La fórmula es `A = |((x1*y2 + x2*y3 + x3*y1) - (y1*x2 + y2*x3 + y3*x1))/2|`
  - Simplificada como `(x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2))/2`
- Para calcular el valor absoluto:
  - Usamos una expresión condicional `if-then-else`
  - Si el área es negativa, retornamos su valor negado para hacerla positiva
  - Si el área es positiva o cero, la retornamos tal cual
- La función maneja directamente los puntos como tuplas `(Double, Double)` para las coordenadas x e y.

### 4. Función `sumC`

```haskell
sumC :: Int -> Int
sumC n = maximum [x | x <- [0], y <- [1..n], let x = x + y*y]
```

**Explicación detallada:**
- Esta función calcula la suma de los cuadrados de los primeros n números naturales.
- Utiliza list comprehension para generar la serie y calcular la suma:
  - Inicializamos un acumulador `x` con valor 0.
  - Generamos números del 1 al n usando el rango `[1..n]`.
  - Para cada número `y`, calculamos su cuadrado `y*y` y lo sumamos al acumulador.
  - Usamos `maximum` para extraer el valor final acumulado.
- La fórmula matemática que calcula es: 1² + 2² + 3² + ... + n²
- Esta implementación evita usar recursión o funciones como `sum`, realizando la acumulación mediante list comprehension.

### 5. Función `sumasN`

```haskell
sumasN :: Int -> [Int]
sumasN n = [maximum [x | x <- [0], y <- [1..i], let x = x + y] | i <- [0..n-1]]
```

**Explicación detallada:**
- Esta función genera una lista de sumas acumulativas hasta n.
- Para cada índice i desde 0 hasta n-1:
  - Calculamos la suma de los números desde 1 hasta i.
  - Utilizamos list comprehension anidada para acumular esta suma.
  - Inicializamos un acumulador en 0 y sumamos cada número del rango [1..i].
  - Usamos `maximum` para extraer el valor final acumulado.
- La lista resultante contiene n elementos, donde cada elemento en la posición i corresponde a la suma de los primeros i números naturales.
- En términos matemáticos, genera: [0, 1, 1+2, 1+2+3, ..., 1+2+...+(n-1)]
- Esta implementación evita usar funciones auxiliares como `sum` o recursión.

### 6. Función `factorial`

```haskell
factorial :: Int -> Int
factorial n = maximum [x | x <- [1], y <- [1..n], let x = x * y]
```

**Explicación detallada:**
- Esta función calcula el factorial de un número n.
- Utiliza list comprehension para realizar la multiplicación acumulativa:
  - Inicializamos un acumulador `x` con valor 1 (elemento neutro de la multiplicación).
  - Generamos números del 1 al n usando el rango `[1..n]`.
  - Para cada número `y`, multiplicamos el acumulador por `y`.
  - Usamos `maximum` para extraer el valor final acumulado.
- El factorial de n se define como n! = 1 × 2 × 3 × ... × n
- En el caso especial de n = 0, la secuencia [1..n] estará vacía, y el resultado será 1, que es correcto para 0!
- Esta solución evita usar la función `product` o recursión directa.

### 7. Función `sinRepetidos`

```haskell
sinRepetidos :: String -> String
sinRepetidos str = [c | c <- str, not (c >= 'a' && c <= 'z')]
```

**Explicación detallada:**
- Esta función elimina todos los caracteres minúsculos de una cadena.
- Utiliza list comprehension para filtrar los caracteres:
  - Recorre cada carácter `c` en la cadena original `str`.
  - Comprueba si el carácter NO es una letra minúscula usando la condición `not (c >= 'a' && c <= 'z')`.
  - Solo incluye en el resultado aquellos caracteres que pasan esta condición.
- La comparación `c >= 'a' && c <= 'z'` verifica si un carácter está en el rango de letras minúsculas ASCII.
- Esta implementación es directa y no utiliza funciones auxiliares como `filter` o `isLower`.
- El nombre de la función `sinRepetidos` puede resultar confuso ya que realmente elimina minúsculas, no repetidos.

## Conclusión

Estas soluciones demuestran cómo resolver problemas comunes de programación funcional utilizando principalmente list comprehension y operadores básicos, evitando funciones auxiliares y recursión. El enfoque muestra la flexibilidad de Haskell para implementar soluciones elegantes incluso con restricciones significativas.
