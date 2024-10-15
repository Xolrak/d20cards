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
|Character|Cards to use, points, hp, dmg, max weigh, badOmens |
|Play|characters, users, rounds, numberofcards, active? |
|Efectos|id, |

This should work as:  
1.  User logs in and  creates a character with name.
2.  Then the  user will ask a number of cards  given to him randomly
3.  After, the user will join a playthru with simmilar cards number 
    * The user rounds and play rounds will increase such as the timer (adding 20 minutes each round). 
    * Imagine: user1 and user2 are in an active play, user1  chooses to  atack user2's beast, one has 6hp and the other 4hp, if the attack is succesful the user2's beast will discard and his hp will go down 2hp points.
    * Imagine: user2 in search of revenge will cast a spell and freeze user1's beast, this will result in the death of the beast and the freeze will affect user1(resting 1 in mana).
    * Any user is able to do a *mulligan*(Discard hand and recieve new ones, no posibility of recalling the first hand) in round 1, then once  the card is used will go on the graveyard and will no longer play.
    * Once every 10 rounds the users will be able to draw more cards, never exceeding the number of cards choosen at the start.
  