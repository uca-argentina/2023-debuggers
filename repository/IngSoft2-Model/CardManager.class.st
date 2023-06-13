Class {
	#name : #CardManager,
	#superclass : #Object,
	#instVars : [
		'deck',
		'lastCardPlayed',
		'playerCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardManager class >> with: somePlayersNames using: aDeck [.

	^ (self new) initializeWith: somePlayersNames using: aDeck.

	
]

{ #category : #'adding Cards' }
CardManager >> addPermanent: aPermanentCard to: aTargetShip [

	( playerCards at: aTargetShip) addToPermanentPile: aPermanentCard.
]

{ #category : #'adding Cards' }
CardManager >> addToAllPermanentPiles: aPermanentCard [
	
	playerCards do: [ :aPlayerCards | aPlayerCards addToPermanentPile: aPermanentCard ].
]

{ #category : #'card playability' }
CardManager >> checkCancel: aPermanentCardToCancel to: targetShip [

	(((playerCards at: targetShip) permanents) anySatisfy: [ :aCard | 
		 aCard equals: aPermanentCardToCancel ]) ifFalse: [ 
		Error signal: 'Unable to cancel the permanent card because there is no such card in effect' ]
]

{ #category : #'card playability' }
CardManager >> checkThat: aCardOwner has: aCard [
	
	| aPlayerCards |
	
	aPlayerCards := playerCards at: aCardOwner.
	
	^ (aPlayerCards hasInHand: aCard) .
	
]

{ #category : #'adding Cards' }
CardManager >> drawCardTo: aTargetHand [
	
	(playerCards at: aTargetHand) addCard: deck draw.
]

{ #category : #initialization }
CardManager >> initializeWith: somePlayersNames using: aDeck [
	
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

{ #category : #'removing cards' }
CardManager >> remove: aCard from: aCardOwner [

	(playerCards at: aCardOwner) removeFromHand: aCard.
]

{ #category : #'removing cards' }
CardManager >> remove: aPermanentCardToCancel to: aTargetShip [
	
	| targetHand |
	
	
	targetHand := playerCards at: aTargetShip.
	targetHand removePermanent: aPermanentCardToCancel.
]

{ #category : #'card effects' }
CardManager >> updateLastCardPlayed: aCard [
			
	lastCardPlayed := aCard.
]

{ #category : #'card effects' }
CardManager >> usePermanentCardsFrom: aPlayer [

	^ (playerCards at: aPlayer) usePermanents.
]
