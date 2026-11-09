Algoritmo Bisiesto
    Definir anio Como Entero
    Escribir "Ingrese el año que desea evaluar:"
    Leer anio
    Si (anio MOD 4 = 0 Y anio MOD 100 <> 0) O (anio MOD 400 = 0) Entonces
        Escribir "El año ", anio, " es bisiesto. Febrero tiene 29 días."
    Sino
        Escribir "El año ", anio, " no es bisiesto. Febrero tiene 28 días."
    FinSi
FinAlgoritmo
