# d20cards
### Designed and implemented by Carlos, Pau L. And Pau G.

## Fase 1. Situation analysis and prototyping of the information system.

### 1. Choosing information system

* We have chosen to implement a database for card games such as *Magic* or *Wharhammer* mostly based on d20 steriotypical board games.
  
> Our reason for choose this topic is mostly related to the basic knowldage of this theme that we already have and a posibly interesting ending; being able to move the cards onto the machine and create new cards to even get more difficult plays, or maybe help the DM *(Dungeon Master)* in creating  his enemies for next oneshots or campains.

>Besides the basics we also like the idea of a more complex build and the probably overwhelming items we will have to deal with. 


* Ideally this database will manage: 
  
|Table|Attributes |
|----|----|
|Cards|id, Name, call to card type(an id) |
|User|id, Name,CharacterID, rounds, *is he/she a DM?* |
|Spell|id, Name, description, dmg, mana needed to invoque |
|Beast|id, Name, description, dmg, hp, mana needed to invoque |
|Object|id, Name, description, weigh, added attributes |
|Character|Cards to use, points, hp, dmg, max weigh |
