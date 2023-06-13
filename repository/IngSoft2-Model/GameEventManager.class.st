Class {
	#name : #GameEventManager,
	#superclass : #Object,
	#instVars : [
		'cardManager',
		'movementManager',
		'currentTurn',
		'turnOrder'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
GameEventManager class >> with: aCardManager and: aMovementManager [

	^ (self new) initializeWith: aCardManager and: aMovementManager.
]

{ #category : #'instance creation' }
GameEventManager class >> with: aCardManager and: aMovementManager and: aTurnOrder [

	^ (self new) initializeWith: aCardManager and: aMovementManager and: aTurnOrder.
]

{ #category : #'as yet unclassified' }
GameEventManager >> applyEffectToCurrentTurnPlayer [

	movementManager applyEffectTo: currentTurn in: self.
]

{ #category : #accessing }
GameEventManager >> cardManager [
	^ cardManager
]

{ #category : #'as yet unclassified' }
GameEventManager >> checkThat: aCardOwner has: aCard [ 
	
	(cardManager checkThat: aCardOwner has: aCard) ifFalse: [ Error signal: 'Unable to play card when the player does not own the card' ]
]

{ #category : #validation }
GameEventManager >> checkThereIsNoWinner [

	movementManager hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #accessing }
GameEventManager >> currentTurn [ 
	
	^ currentTurn.
]

{ #category : #initialization }
GameEventManager >> initializeWith: aCardManager and: aMovementManager [

	cardManager := aCardManager.
	movementManager := aMovementManager.
]

{ #category : #initialization }
GameEventManager >> initializeWith: aCardManager and: aMovementManager and: aTurnOrder [

	cardManager := aCardManager.
	movementManager := aMovementManager.
	turnOrder := aTurnOrder.
	currentTurn := aTurnOrder next.
]

{ #category : #'as yet unclassified' }
GameEventManager >> moveCurrentTurnPlayer: aDiceResult [
	
	| permanentCardsModifiers |
	
	permanentCardsModifiers := cardManager usePermanentCardsFrom: currentTurn.
	movementManager updatePosition: (aDiceResult + permanentCardsModifiers) to: currentTurn.
]

{ #category : #accessing }
GameEventManager >> movementManager [
	^ movementManager
]

{ #category : #removing }
GameEventManager >> remove: aCard from: aCardOwner [
	
	cardManager remove: aCard from: aCardOwner.
]

{ #category : #accessing }
GameEventManager >> shipLaps [

	^ movementManager shipLaps.
]

{ #category : #accessing }
GameEventManager >> shipPositions [
	
	^ movementManager shipPositions.
]

{ #category : #'game status' }
GameEventManager >> shipRanking [

	^ movementManager shipRanking.
]

{ #category : #'as yet unclassified' }
GameEventManager >> updateLastCardPlayed: aCard [

	cardManager updateLastCardPlayed: aCard.
]

{ #category : #'as yet unclassified' }
GameEventManager >> updateTurn [.

	currentTurn := turnOrder next.
	cardManager updateTurn: currentTurn.
]

{ #category : #'game status' }
GameEventManager >> winner [

	^ movementManager winner.
]
