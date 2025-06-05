# 🖨️ ft_printf - Implementación Personalizada de printf en C

## 🎯 Propósito y Alcance

`ft_printf` es una implementación personalizada de la función estándar `printf` de C. Esta biblioteca replica las funcionalidades principales de `printf` a través de una arquitectura modular que incluye manejadores especializados para formatos de caracteres, cadenas, enteros, enteros sin signo, hexadecimal y punteros.

## 🧱 Arquitectura del Sistema

La biblioteca `ft_printf` sigue una arquitectura basada en un despachador, donde la función principal `ft_printf` analiza las cadenas de formato y dirige los especificadores de formato a funciones manejadoras especializadas.

## 🔧 Componentes Principales

La biblioteca consta de siete archivos fuente principales, cada uno con un propósito específico en la implementación de `printf`:

| Componente         | Archivo           | Propósito                                                        |
|--------------------|-------------------|------------------------------------------------------------------|
| Despachador Principal | `ft_printf.c`     | Punto de entrada, análisis de la cadena de formato y enrutamiento de especificadores |
| Salida de Caracteres | `ft_putchar.c`    | Escritura fundamental de caracteres en descriptores de archivo   |
| Salida de Cadenas   | `ft_putstr.c`     | Formateo de cadenas con manejo de valores nulos                  |
| Enteros con Signo   | `ft_putnbr.c`     | Formateo de enteros decimales, incluyendo números negativos      |
| Enteros sin Signo   | `ft_putunsig.c`   | Formateo de enteros decimales sin signo                          |
| Hexadecimal         | `ft_puthex.c`     | Formateo en base 16 con soporte para mayúsculas/minúsculas       |
| Direcciones de Puntero | `ft_putptr.c`     | Formateo de direcciones de memoria con prefijo `0x`              |

La función `ft_putchar` sirve como mecanismo de salida fundamental, siendo llamada por todas las demás funciones de formateo para la salida carácter por carácter. Este diseño asegura un manejo de errores consistente y un conteo de caracteres uniforme en todos los tipos de formato.

## 🧩 Diseño de la Interfaz de Funciones

Todas las funciones de formateo siguen un patrón de interfaz consistente para un manejo de errores unificado y seguimiento de la longitud de salida.

El diseño de la interfaz utiliza un parámetro compartido `int *len` en todas las funciones para mantener un conteo preciso de los caracteres escritos. Cada función retorna `-1` en caso de error o un indicador de éxito, permitiendo una propagación rápida de errores a través de la pila de llamadas.

## 🛠️ Sistema de Construcción

La biblioteca se compila en una biblioteca estática `libftprintf.a` utilizando una configuración estándar de Makefile:

- **Compilador**: `gcc` con banderas estrictas de advertencia (`-Wall -Wextra -Werror`)
- **Herramienta de construcción**: `ar rc` para la creación de la biblioteca estática
- **Dependencias**: Todos los archivos objeto dependen de `ft_printf.h` y del Makefile
- **Objetivos**: `all`, `clean`, `fclean`, `re` para operaciones estándar de construcción

El sistema de construcción asegura que todos los archivos fuente se compilen con banderas de compilador consistentes y se vinculen en una única biblioteca estática para facilitar la integración con programas del usuario.

## ✅ Especificadores de Formato Soportados

La implementación de `ft_printf` soporta los siguientes especificadores de formato estándar de `printf`:

| Especificador | Función Manejadora | Propósito                                        |
|---------------|--------------------|--------------------------------------------------|
| `%c`          | `ft_putchar`       | Salida de un solo carácter                       |
| `%s`          | `ft_putstr`        | Salida de cadena terminada en nulo               |
| `%d`, `%i`    | `ft_putnbr`        | Enteros decimales con signo                      |
| `%u`          | `ft_putunsig`      | Enteros decimales sin signo                      |
| `%x`, `%X`    | `ft_puthex`        | Hexadecimal (minúsculas/mayúsculas)              |
| `%p`          | `ft_putptr`        | Direcciones de puntero con prefijo `0x`          |

Cada especificador de formato es manejado por una función dedicada que implementa la lógica específica de formateo mientras mantiene una interfaz consistente para el manejo de errores y el conteo de caracteres.

## 📌 Notas Finales

La biblioteca `ft_printf` proporciona una implementación modular y eficiente de la función `printf`, facilitando su integración en proyectos en C que requieran funcionalidades de formateo personalizadas.

---

¡Espero que este archivo `README.md` sea de utilidad para tu repositorio! Si necesitas más ayuda o deseas personalizarlo aún más, ¡no dudes en decírmelo! 😊
