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
GameEventManager class >> with: aCardManager and: aMovementManager and: aTurnOrder [

	^ (self new) initializeWith: aCardManager and: aMovementManager and: aTurnOrder.
]

{ #category : #playing }
GameEventManager >> applyEffectToCurrentTurnPlayer [

	movementManager applyEffectTo: (Ship with: currentTurn) in: self.
]

{ #category : #accessing }
GameEventManager >> cardManager [
	^ cardManager
]

{ #category : #validation }
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
GameEventManager >> initializeWith: aCardManager and: aMovementManager and: aTurnOrder [

	cardManager := aCardManager.
	movementManager := aMovementManager.
	turnOrder := aTurnOrder.
	currentTurn := aTurnOrder next.
]

{ #category : #playing }
GameEventManager >> moveCurrentTurnPlayer: aDiceResult [
	
	| permanentCardsModifiers |
	
	permanentCardsModifiers := cardManager usePermanentCardsFrom: (PlayerCards from: currentTurn).
	movementManager updatePosition: (aDiceResult + permanentCardsModifiers) to: (Ship with: currentTurn).
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

{ #category : #playing }
GameEventManager >> updateLastCardPlayed: aCard [

	cardManager updateLastCardPlayed: aCard.
]

{ #category : #playing }
GameEventManager >> updateTurn [

	currentTurn := turnOrder next.
]

{ #category : #'game status' }
GameEventManager >> winner [

	^ movementManager winner.
]
