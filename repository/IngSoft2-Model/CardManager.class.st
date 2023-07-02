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

{ #category : #'instance creation' }
CardManager class >> with: somePlayersNames using: aDeck [

	^ (self new) initializeWith: somePlayersNames using: aDeck.

	
]

{ #category : #'adding Cards' }
CardManager >> addPermanent: aPermanentCard to: aTargetPlayerCards [

	( playerCards detect: [:aPlayerCards | aPlayerCards equals: aTargetPlayerCards]) addToPermanentPile: aPermanentCard.
]

{ #category : #'adding Cards' }
CardManager >> addToAllPermanentPiles: aPermanentCard [
	
	playerCards do: [ :aPlayerCards | aPlayerCards addToPermanentPile: aPermanentCard ].
]

{ #category : #'card playability' }
CardManager >> checkCancel: aPermanentCardToCancel to: aTargetPlayerCards [

	(((playerCards detect: [:aPlayerCards | aPlayerCards equals: aTargetPlayerCards]) permanents) anySatisfy: [ :aCard | 
		 aCard equals: aPermanentCardToCancel ]) ifFalse: [ 
		Error signal: 'Unable to cancel the permanent card because there is no such card in effect' ]
]

{ #category : #'card playability' }
CardManager >> checkThat: aCardOwner has: aCard [
		
	^ ((playerCards detect: [:aPlayerCards | aPlayerCards equals: aCardOwner]) hasInHand: aCard) .
	
]

{ #category : #'adding Cards' }
CardManager >> drawCardTo: aTargetPlayerCards [
	
	(playerCards detect: [:aPlayerCards | aPlayerCards equals: aTargetPlayerCards]) addCard: deck draw.
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
CardManager >> remove: aCard from: aTargetPlayerCards [

	(playerCards detect: [:aPlayerCards | aPlayerCards equals: aTargetPlayerCards]) removeFromHand: aCard.
]

{ #category : #'removing cards' }
CardManager >> remove: aPermanentCardToCancel to: aTargetPlayerCards [
	
	| targetHand |
	
	
	targetHand := playerCards detect: [:aPlayerCards | aPlayerCards equals: aTargetPlayerCards].
	targetHand removePermanent: aPermanentCardToCancel.
]

{ #category : #'card effects' }
CardManager >> updateLastCardPlayed: aCard [
			
	lastCardPlayed := aCard.
]

{ #category : #'card effects' }
CardManager >> usePermanentCardsFrom: aPlayer [

	^ (playerCards detect: [:aPlayerCards | aPlayerCards equals: aPlayer]) usePermanents.
]
