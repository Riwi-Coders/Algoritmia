# Tablas de Verdad y Casos de Prueba

## ValidarRegistro.psc

### Tabla de verdad

| Edad >= 14 | ACEPTA | RESULTADO |
| :--------: | :----: | :-------: |
|     V      |   V    | Registro  |
|     V      |   F    |    No     |
|     F      |   V    |    No     |
|     F      |   F    |    No     |

### Casos de Prueba

| Edad | Respuesta |    Esperado    |     Obtenido     |
| :--: | :-------: | :------------: | :--------------: |
| `14` |     S     |  Se registra   |  Se registra     |
| `13` |     S     | No se registra | No se registra   |
| `30` |     n     | No se registra | No se registra   |
| `14` |     s     |  Se registra   |  Se registra     |

### logs de ejecución

```
*** Ejecución Iniciada. ***
Cuantos años tienes?
> 14
Aceptas los términos? (S/N)
> S
Registro exitoso
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Cuantos años tienes?
> 13
Aceptas los términos? (S/N)
> S
No puedes registrarte
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Cuantos años tienes?
> 30
Aceptas los términos? (S/N)
> n
No puedes registrarte
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Cuantos años tienes?
> 14
Aceptas los términos? (S/N)
> s
Registro exitoso
*** Ejecución Finalizada. ***
```

## ValidarEdad.psc

### Tabla de verdad

| R1: Edad < 0 | R2: Edad > 120 |      R1 ó R2      |
| :----------: | :------------: | :---------------: |
|      V       |       V        | V (edad inválida) |
|      V       |       F        | V (edad inválida) |
|      F       |       V        | V (edad inválida) |
|      F       |       F        |  F (edad válida)  |

### casos de prueba

| Edad  | Edad < 0 | Edad > 120 |   Esperado    |     Obtenido     |
| :---: | :------: | :--------: | :-----------: | :--------------: |
| `-1`  |    V     |     F      | Edad inválida | Edad inválida    |
|  `0`  |    F     |     F      |  Edad válida  |  Edad válida     |
| `120` |    F     |     F      |  Edad válida  |  Edad válida     |
| `121` |    F     |     V      | Edad inválida | Edad inválida    |

### logs de ejecución

```
*** Ejecución Iniciada. ***
ingresar edad
> -1
Edad inválida
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
ingresar edad
> 0
Edad válida
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
ingresar edad
> 120
Edad válida
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
ingresar edad
> 121
Edad inválida
*** Ejecución Finalizada. ***
```

## Parqueadero.psc

### Tabla de decisión

| Regla | Tipo         | Minutos    | Factura    | Resultado                         |
| ----- | ------------ | ---------- | ---------- | --------------------------------- |
| R1    | Cualquiera   | Menos de 0 | Cualquiera | Error: minutos negativos          |
| R2    | Ni 1 ni 2    | 0 o más    | Cualquiera | Error: tipo no válido             |
| R3    | Carro o moto | De 0 a 15  | Cualquiera | Gratis                            |
| R4    | Carro o moto | Más de 15  | No         | Horas × tarifa, máximo $30.000    |
| R5    | Carro o moto | Más de 15  | Sí         | Lo mismo que R4, dividido entre 2 |

### Casos Borde

| #   | Tipo  | Min | Fact | H   | Esperado          | Validacion|
| --- | ----- | --- | ---- | --- | ----------------- | --------- |
| 1   | Carro | 15  | No   | –   | 0                 | Sí        |
| 2   | Carro | 16  | No   | 1   | 4.000             | Sí        |
| 3   | Carro | 60  | No   | 1   | 4.000             | Sí        |
| 4   | Carro | 61  | No   | 2   | 8.000             | Sí        |
| 5   | Moto  | 61  | Sí   | 2   | 2.000             | Sí        |
| 6   | Carro | 600 | No   | 10  | 30.000 (tope)     | Sí        |
| 7   | Carro | 600 | Sí   | 10  | 15.000            | Sí        |
| 8   | 3     | 30  | No   | –   | Tipo no válido    | Sí        |
| 9   | Carro | -5  | No   | –   | Minutos negativos | Sí        |

### Prueba de escriotio

#### Caso 4: Carro, 61 minutos, sin factura

| Paso           | Tipo | Min | Fact | tarifa | horas | valor |
| -------------- | ---- | --- | ---- | ------ | ----- | ----- |
| lee datos      | 1    | 61  | N    |        |       |       |
| segun tipo     | 1    | 61  | N    | 4000   |       |       |
| calcula horas  | 1    | 61  | N    | 4000   | 2     |       |
| calcula valor  | 1    | 61  | N    | 4000   | 2     | 8000  |
| aplica tope    | 1    | 61  | N    | 4000   | 2     | 8000  |
| aplica factura | 1    | 61  | N    | 4000   | 2     | 8000  |

#### Caso 5: Moto, 61 minutos, con factura

| Paso           | Tipo | Min | Fact | tarifa | horas | valor |
| -------------- | ---- | --- | ---- | ------ | ----- | ----- |
| lee datos      | 2    | 61  | S    |        |       |       |
| segun tipo     | 2    | 61  | S    | 2000   |       |       |
| calcula horas  | 2    | 61  | S    | 2000   | 2     |       |
| calcula valor  | 2    | 61  | S    | 2000   | 2     | 4000  |
| aplica tope    | 2    | 61  | S    | 2000   | 2     | 4000  |
| aplica factura | 2    | 61  | S    | 2000   | 2     | 2000  |

### logs de ejecución

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 15
tiene factura de compra? (S/N)
> N
Valor a pagar: $0
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 16
tiene factura de compra? (S/N)
> n
Valor a pagar: $4000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 60
tiene factura de compra? (S/N)
> N
Valor a pagar: $4000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 61
tiene factura de compra? (S/N)
> n
Valor a pagar: $8000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 2
Minutos de permanencia:
> 61
tiene factura de compra? (S/N)
> S
Valor a pagar: $2000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 600
tiene factura de compra? (S/N)
> n
Valor a pagar: $30000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> 600
tiene factura de compra? (S/N)
> S
Valor a pagar: $15000
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 3
Minutos de permanencia:
> 30
tiene factura de compra? (S/N)
> n
Error: tipo de vehículo no válido.
*** Ejecución Finalizada. ***
```

```
*** Ejecución Iniciada. ***
Tipo de vehículo (1 = carro, 2 = moto):
> 1
Minutos de permanencia:
> -5
tiene factura de compra? (S/N)
> n
Error: minutos no pueden ser negativos.
*** Ejecución Finalizada. ***
```