![alt text](./img/arbol.png)

### 1. Tabla de traza: `CajeroParqueadero.psc` (Prueba con `4000, 8000, 2000, 0`)

| Paso | `valor` | `total` | `carros` | Condición `valor <> 0` |
| :--- | :---: | :---: | :---: | :--- |
| Inicio | - | 0 | 0 | - |
| Lectura 1 | 4000 | 0 | 0 | Verdadero (entra) |
| Ciclo 1 | 4000 | 4000 | 1 | - |
| Lectura 2 | 8000 | 4000 | 1 | Verdadero (entra) |
| Ciclo 2 | 8000 | 12000 | 2 | - |
| Lectura 3 | 2000 | 12000 | 2 | Verdadero (entra) |
| Ciclo 3 | 2000 | 14000 | 3 | - |
| Lectura 4 | 0 | 14000 | 3 | Falso (sale del ciclo) |

**Salida final:**
* Total recaudado: `$14000`
* Cantidad de carros: `3`

---


### 2. Tabla de traza: `Piramide.psc` (Prueba con `n = 4`)

| Fila (`i`) | Límite espacios (`n - i`) | Ciclo espacios (`j`) | Límite asteriscos (`2 * i - 1`) | Ciclo asteriscos (`k`) | Salida en consola |
| :---: | :---: | :--- | :---: | :--- | :--- |
| **1** | `4 - 1 = 3` | `1, 2, 3` (3 espacios) | `2(1) - 1 = 1` | `1` (1 asterisco) | `   *` |
| **2** | `4 - 2 = 2` | `1, 2` (2 espacios) | `2(2) - 1 = 3` | `1, 2, 3` (3 asteriscos) | `  ***` |
| **3** | `4 - 3 = 1` | `1` (1 espacio) | `2(3) - 1 = 5` | `1, 2, 3, 4, 5` (5 asteriscos) | ` *****` |
| **4** | `4 - 4 = 0` | No entra (0 espacios) | `2(4) - 1 = 7` | `1, 2, 3, 4, 5, 6, 7` (7 asteriscos) | `*******` |

**Salida final:**

```text
   *
  ***
 *****
*******
```