# d20cards
### Diseñado e implementado por Carlos, Pau L. y Pau G.

## Fase 1. Análisis de la situación y prototipado del sistema de información.

### 1. Elección del sistema de información

* Hemos elegido implementar una base de datos para juegos de cartas como Magic o Warhammer, principalmente basados en juegos de mesa estereotípicos de d20.
  
> Nuestra razón para elegir este tema está principalmente relacionada con el conocimiento básico de este tema que ya tenemos y un posible final interesante; poder mover las cartas a la máquina y crear nuevas cartas para realizar jugadas aún más difíciles, o tal vez ayudar al DM (Dungeon Master) en la creación de sus enemigos para futuras partidas o campañas.

>Además de lo básico, también nos gusta la idea de una construcción más compleja y los probablemente abrumadores elementos con los que tendremos que lidiar.

* Idealmente, esta base de datos gestionará:
  
|Tabla|Atributos|
|----|----|
|Cartas|id, Nombre, tipo de carta (un id) |
|Usuario|id, Nombre, CharacterID, rondas, *¿es un/una DM?* |
|Hechizo|id, Nombre, descripción, daño, maná necesario para invocar|
|Bestia|id, Nombre, descripción, daño, hp, maná necesario para invocar |
|Objeto|id, Name, description, weigh, added attributeid, Nombre, descripción, peso, atributos adicionaless |
|Personaje|Cartas a usar, puntos, hp, daño, peso máximo, maldiciones |
|Partida|personajes, usuarios, rondas, número de cartas, ¿activo? |
|Efectos|id, |

Esto debería funcionar de la siguiente manera:
1.  El usuario inicia sesión y crea un personaje con un nombre.
2.  Luego, el usuario solicitará un número de cartas que se le entregarán aleatoriamente.
3. Después, el usuario se unirá a una partida con un número similar de cartas.
    * Las rondas del usuario y las rondas de la partida aumentarán, así como el temporizador (agregando 20 minutos por ronda).
    * Imagina: el usuario1 y el usuario2 están en una partida activa, el usuario1 elige atacar la bestia del usuario2, una tiene 6hp y la otra 4hp; si el ataque tiene éxito, la bestia del usuario2 será descartada y su hp bajará 2 puntos.
    * Imagina: el usuario2, en busca de venganza, lanzará un hechizo y congelará la bestia del usuario1; esto resultará en la muerte de la bestia y el congelamiento afectará al usuario1 (restando 1 de maná).
    * Cualquier usuario podrá hacer un mulligan (descartar la mano y recibir una nueva, sin posibilidad de recuperar la primera mano) en la ronda 1, luego, una vez que la carta sea utilizada, irá al cementerio y ya no podrá jugarse.
    * Una vez cada 10 rondas, los usuarios podrán robar más cartas, sin exceder el número de cartas elegidas al inicio.

