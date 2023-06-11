Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'deck',
		'lastCardPlayed',
		'playerCards',
		'currentTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardManager class >> with: somePlayersNames using: aDeck [.

	^ (self new) initializeWith: somePlayersNames using: aDeck.

	
]

{ #category : #'card effects' }
CardManager >> addPermanent: aPermanentCard to: aTargetShip [

	( playerCards at: aTargetShip) addToPermanentPile: aPermanentCard.
]

{ #category : #'card effects' }
CardManager >> addToAllPermanentPiles: aPermanentCard [
	
	playerCards do: [ :aPlayerCards | aPlayerCards addToPermanentPile: aPermanentCard ].
]

{ #category : #'as yet unclassified' }
CardManager >> checkCancel: aPermanentCardToCancel to: targetShip [

	(((playerCards at: targetShip) permanents) anySatisfy: [ :aCard | 
		 aCard equals: aPermanentCardToCancel ]) ifFalse: [ 
		Error signal: 'Unable to cancel the permanent card because there is no such card in effect' ]
]

{ #category : #'as yet unclassified' }
CardManager >> checkThat: aCardOwner has: aCard [
	
	| aPlayerCards |
	
	aPlayerCards := playerCards at: aCardOwner.
	
	(aPlayerCards hasInHand: aCard) ifFalse: [ Error signal: 'Unable to play card when the player does not own the card' ]
	
]

{ #category : #accessing }
CardManager >> currentTurn [

	^ currentTurn.
]

{ #category : #initialization }
CardManager >> initializeWith: somePlayersNames using: aDeck [
	
	currentTurn := 1.
	deck := aDeck.
	lastCardPlayed := NonPlayableCard new.
	playerCards := OrderedCollection new.
	playerCards := somePlayersNames collect: [ :aPlayerName | 
		               | aPlayerCards |
		               aPlayerCards := PlayerCards from: aPlayerName.
		               aPlayerCards addCard: deck draw.
		               aPlayerCards addCard: deck draw ].
]

{ #category : #accessing }
CardManager >> lastCardPlayed [
	
	^ lastCardPlayed.
]

{ #category : #removing }
CardManager >> remove: aCard from: aCardOwner [

	(playerCards at: aCardOwner) removeFromHand: aCard.
]

{ #category : #removing }
CardManager >> remove: aPermanentCardToCancel to: aTargetShip [
	
	| targetHand |
	
	
	targetHand := playerCards at: aTargetShip.
	targetHand removePermanent: aPermanentCardToCancel.
]

{ #category : #'as yet unclassified' }
CardManager >> updateLastCardPlayed: aCard [
			
	lastCardPlayed := aCard.
]

{ #category : #'as yet unclassified' }
CardManager >> updateTurn: aTurnNumber [

	currentTurn := aTurnNumber.
]

{ #category : #'as yet unclassified' }
CardManager >> usePermanentCardsFrom: aPlayer [

	^ (playerCards at: aPlayer) usePermanents.
]