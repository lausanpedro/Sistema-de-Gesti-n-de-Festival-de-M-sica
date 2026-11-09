# 🎵 Sistema de Gestión de Festival de Música

## 📌 Descripción

Este proyecto consiste en el desarrollo de un sistema de gestión de festivales de música, realizado como trabajo práctico en el contexto de Programación Orientada a Objetos.

La aplicación permite administrar los espectáculos que forman parte de un festival, controlar el presupuesto destinado a los artistas y realizar diferentes consultas sobre los espectáculos registrados.

El sistema fue desarrollado utilizando **Dolphin Smalltalk**, aplicando conceptos fundamentales de la programación orientada a objetos, como clases, herencia, encapsulamiento y polimorfismo.

## 🚀 Funcionalidades

El sistema cuenta con un menú interactivo que permite realizar las siguientes operaciones:

1. **Agregar espectáculo:** registrar nuevos artistas o bandas, validando que no existan códigos duplicados y que el presupuesto disponible sea suficiente.
2. **Buscar y modificar espectáculo:** localizar un espectáculo mediante su código y modificar sus atributos.
3. **Eliminar espectáculo:** eliminar un espectáculo registrado mediante su código.
4. **Listar espectáculos confirmados:** mostrar únicamente los espectáculos cuyo estado sea confirmado.
5. **Filtrar por género musical:** consultar los espectáculos pertenecientes a un género determinado.
6. **Consultar espectáculos de corta duración:** mostrar aquellos cuya duración sea inferior a 45 minutos.
7. **Promedio de costos:** calcular el costo promedio de los espectáculos confirmados y mostrar aquellos que superan dicho promedio.
8. **Espectáculo de mayor costo:** identificar el espectáculo con el costo total más elevado.
9. **Consultar presupuesto disponible:** calcular cuánto presupuesto queda disponible para contratar artistas.
10. **Eliminar espectáculos cancelados:** eliminar todos los espectáculos cuyo estado sea cancelado.
11. **Contabilizar espectáculos por escenario:** mostrar la cantidad de espectáculos asignados a cada escenario, excluyendo los cancelados.
12. **Listar todos los espectáculos:** visualizar los espectáculos registrados en el festival.

## 🏗️ Arquitectura del sistema

El proyecto está organizado en cuatro clases principales:

### Festival

Representa al festival de música y administra la colección de espectáculos.

Sus principales responsabilidades son:
- Almacenar los datos generales del festival.
- Agregar y eliminar espectáculos.
- Controlar que no existan códigos duplicados.
- Verificar que las contrataciones respeten el presupuesto máximo.
- Consultar los espectáculos registrados.

### Espectaculo

Es la clase base que representa los atributos y comportamientos comunes de los espectáculos.

Contiene información como:
- Código.
- Nombre artístico.
- Género musical.
- Escenario.
- Hora de inicio.
- Duración.
- Caché.
- Estado.

### Solista

Es una subclase de `Espectaculo` que representa a un artista individual.

Agrega los atributos:
- Instrumento.
- País de origen.

Su costo total se calcula aplicando un adicional del 10% sobre el caché.

### Banda

Es una subclase de `Espectaculo` que representa a un grupo musical.

Agrega los atributos:
- Cantidad de integrantes.
- Año de formación.

Su costo total se calcula aplicando un adicional del 2% por cada integrante sobre el caché.

## 🧠 Conceptos de programación aplicados

Durante el desarrollo se aplicaron los siguientes conceptos de Programación Orientada a Objetos:

- **Clases y objetos:** representación de las entidades principales del dominio.
- **Herencia:** las clases `Solista` y `Banda` heredan los atributos y comportamientos comunes de `Espectaculo`.
- **Encapsulamiento:** utilización de métodos de acceso y modificación para trabajar con los atributos de los objetos.
- **Polimorfismo:** cada subclase implementa su propia forma de calcular el costo total mediante el método `costototal`.
- **Colecciones:** utilización de `OrderedCollection` para administrar los espectáculos.
- **Diccionarios:** utilización de `Dictionary` para contabilizar los espectáculos por escenario.
- **Bloques y mensajes:** utilización de bloques y mensajes propios de Smalltalk para recorrer, filtrar y procesar colecciones.

## 🛠️ Tecnologías utilizadas

- **Lenguaje:** Smalltalk.
- **Entorno de desarrollo:** Dolphin Smalltalk.
- **Paradigma:** Programación Orientada a Objetos.

## ▶️ Ejecución

1. Instalar o disponer del entorno Dolphin Smalltalk.
2. Abrir el proyecto en el entorno de desarrollo.
3. Cargar las clases correspondientes al sistema.
4. Ejecutar el programa principal.
5. Utilizar el menú interactivo para gestionar los espectáculos del festival.

*Nota: los pasos exactos de carga y ejecución dependen de cómo se haya guardado y organizado el proyecto en Dolphin Smalltalk.*

## 📚 Contexto académico

Proyecto desarrollado con fines académicos para poner en práctica los conceptos de Programación Orientada a Objetos mediante el desarrollo de un sistema de gestión.

---

Lautaro San Pedro Bournissen.

Sistema de Gestión de Festival de Música
