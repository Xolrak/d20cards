# d20cards
### Diseñado e implementado por Carlos, Pau L. y Pau G.

## Indice
1. [Elección del sistema de información](#1-elección-del-sistema-de-información)  
1.1 [Objetivos del sistema de información](#11-objetivos-del-sistema-de-información)  
1.2 [Objetivos de proyecto](#12-objetivos-del-proyecto)  
1.3 [Objetivos del fase](#13-objetivos-del-fase)  
2. [Diseño de la bbdd](#2-diseño-de-la-bbdd)  
2.1 [Diseño de tablas](#21-diseño-de-tablas)  
2.2 [Funcionamiento](#22-funcionamiento)  



## Fase 1. Análisis de la situación y prototipado del sistema de información.

### 1. Elección del sistema de información

* Hemos elegido implementar una base de datos para juegos de cartas como Magic o Warhammer, principalmente basados en juegos de mesa estereotípicos de d20.
  
Nuestra razón para elegir este tema está principalmente relacionada con el conocimiento básico de este tema que ya tenemos y un posible final interesante; poder mover las cartas a la máquina y crear nuevas cartas para realizar jugadas aún más difíciles, o tal vez ayudar al DM (Dungeon Master) en la creación de sus enemigos para futuras partidas o campañas.

Además de lo básico, también nos gusta la idea de una construcción más compleja y los probablemente abrumadores elementos con los que tendremos que lidiar.

#### 1.1 Objetivos del sistema de información

* Gestión eficiente de datos: Crear una base de datos que permita almacenar, organizar y recuperar información sobre cartas, personajes, usuarios, partidas, y sus relaciones de manera eficiente.  
* Facilitar la jugabilidad: Proporcionar a los usuarios un acceso rápido y sencillo a los datos de las cartas y personajes, permitiéndoles centrarse en la estrategia del juego.  
* Automatización de tareas del DM: Reducir el esfuerzo manual del Dungeon Master al crear enemigos, partidas o manejar las estadísticas.  
* Escalabilidad: Diseñar una base de datos capaz de manejar un crecimiento en el número de usuarios, cartas y partidas.

#### 1.2 Objetivos del proyecto

* Desarrollar una aplicación funcional que permita a los usuarios crear personajes, gestionar cartas y participar en partidas de manera interactiva.
* Implementar un sistema de información robusto y escalable que soporte las interacciones descritas en el juego.
* Diseñar una interfaz que facilite tanto a jugadores como al Dungeon Master la interacción con el sistema.
* Permitir futuras extensiones como la creación de nuevas cartas o modalidades de juego.

#### 1.3 Objetivos del fase

* Identificar las entidades clave y sus relaciones para diseñar un modelo conceptual de la base de datos.
* Determinar los flujos de datos entre las diferentes entidades y usuarios del sistema.
* Analizar posibles desafíos técnicos y funcionales relacionados con el manejo de la información.
* Crear un prototipo inicial del sistema para validar la estructura y la lógica antes de proceder a la implementación.

## 2. Diseño de la bbdd
La base de datos está diseñada para gestionar la información de las cartas, usuarios, personajes, hechizos, bestias, objetos, y las partidas de forma eficiente.  
A continuación, explico las decisiones clave tomadas en cuanto a las tablas y sus relaciones.


| **Tabla**       | **Atributos**                                                                            | **Justificación**                                                                                   |
|-----------------|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Cartas**      | id, Nombre, tipo de carta (un id)                                                        | Almacenamos información de las cartas que los jugadores usarán en sus partidas. Necesitamos identificar cada carta con un ID único. El "tipo de carta" se usa para diferenciar entre hechizos, bestias u otros tipos de cartas. |
| **Usuario**     | id, Nombre, CharacterID, rondas, ¿es un/una DM?                                          | Esta tabla representa a los jugadores. Se guarda el nombre del usuario, su ID de personaje, el número de rondas jugadas y si es un Dungeon Master (DM). El CharacterID permite vincular al usuario con un personaje específico. |
| **Hechizo**     | id, Nombre, descripción, daño, maná necesario para invocar                               | Los hechizos son una parte crucial del juego. Se necesita información sobre el nombre, la descripción y los efectos del hechizo, como el daño y el maná necesario para usarlo. |
| **Bestia**      | id, Nombre, descripción, daño, hp, maná necesario para invocar                          | Al igual que los hechizos, las bestias son componentes clave en el juego. Se guardan atributos como daño, puntos de vida (hp) y maná necesario para invocar la bestia. |
| **Objeto**      | id, Nombre, descripción, peso, atributos adicionales (id)                                | Los objetos en el juego tienen propiedades adicionales, como su peso o atributos extra. Esta tabla permite almacenar estos detalles y vincular objetos a los personajes o las cartas. |
| **Personaje**   | Cartas a usar, puntos, hp, daño, peso máximo, maldiciones                                | Un personaje está relacionado con las cartas que posee, sus puntos de vida (hp), el daño que puede infligir, su peso máximo de objetos, y las maldiciones que puedan afectarle durante el juego. |
| **Partida**     | personajes, usuarios, rondas, número de cartas, ¿activo?                                | La tabla de partidas contiene la información sobre cada partida activa: los personajes y usuarios involucrados, las rondas, y el número de cartas disponibles para cada jugador. El atributo "activo" indica si la partida está en curso o no. |
| **Efectos**     | id, descripción, duración, efecto sobre carta o personaje                               | Los efectos son eventos que afectan a las cartas o personajes durante la partida (por ejemplo, hechizos que afectan a las bestias o a los personajes). Esta tabla permite gestionar esos efectos dinámicos. |

### 2.1 Diseño de tablas

Relaciones entre tablas:
La estructura de la base de datos está diseñada para permitir relaciones entre las distintas entidades. Por ejemplo:

Usuario y Personaje: Un usuario puede crear un personaje, por lo que Usuario tiene un campo CharacterID que se conecta con la tabla Personaje.
Cartas y Personaje: Los personajes usan cartas durante las partidas, por lo que la tabla Personaje tiene un campo para almacenar las cartas asociadas a cada uno.
Escalabilidad y flexibilidad:
El diseño de las tablas busca permitir una expansión fácil. Por ejemplo, la tabla Cartas tiene un campo tipo de carta, lo que permite que se agreguen nuevos tipos de cartas (hechizos, bestias, objetos, etc.) sin necesidad de modificar la estructura de la base de datos.

Optimización del rendimiento:
Las tablas están optimizadas para realizar consultas rápidas y eficientes. La tabla Partida tiene un campo para indicar si la partida está activa o no, lo que facilita la búsqueda de partidas en curso y evita la necesidad de revisar todos los registros.

Estrategia de normalización:
Se han normalizado las tablas para evitar redundancias. Por ejemplo, los hechizos y las bestias tienen sus propias tablas porque sus atributos no son siempre iguales a los de las cartas o personajes, lo que facilita el mantenimiento de la base de datos.

Desafíos previstos:
Algunos posibles desafíos a los que nos enfrentaremos son:

Gestión de grandes volúmenes de datos: A medida que aumenten los jugadores, cartas y partidas, la base de datos debe poder manejar la carga sin problemas.
Actualización dinámica de cartas: Dado que el juego está en constante evolución, es importante que la base de datos permita agregar y modificar cartas de manera sencilla y eficiente.

### 2.2 Funcionamiento
Inicio de sesión y creación de personaje:
Cuando un usuario inicia sesión, se crea un personaje asociado a su cuenta. El personaje puede tener cartas, hechizos, bestias y objetos que le serán útiles durante el juego.

Generación de cartas aleatorias:
Tras crear su personaje, el usuario recibe una mano aleatoria de cartas. La base de datos gestiona el proceso de entrega de cartas de forma aleatoria y asegura que el número de cartas asignadas esté dentro de los límites establecidos.

Gestión de partidas:
Los usuarios se unen a partidas con otras personas, y la base de datos sigue el progreso de las partidas, registrando rondas, movimientos y el estado de las cartas (jugadas, descartadas, etc.).

![Diagrama Preview](./Diagram/diagramV2.png)


