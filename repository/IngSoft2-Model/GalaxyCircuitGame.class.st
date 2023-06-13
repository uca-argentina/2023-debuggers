Class {
	#name : #GalaxyCircuitGame,
	#superclass : #Object,
	#instVars : [
		'diceCup',
		'gameEventManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
GalaxyCircuitGame class >> checkForDuplicated: somePlayerNames [

	somePlayerNames do: [ :aName | 
		(somePlayerNames count: [ :anotherName | 
			 aName = anotherName ]) >= 2 ifTrue: [ 
			Error signal: 'Ship already exists with that name' ] ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkLaps: anAmountOfLaps [ 

	(anAmountOfLaps <= 0) ifTrue: [ Error signal: 'Amount of laps cannot be 0 or lower' ]
]

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [
	self checkForDuplicated: somePlayersName.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck).
]

{ #category : #accessing }
GalaxyCircuitGame >> currentTurn [

	^ gameEventManager currentTurn.
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [

	| aCardManager aMovementManager counter turns aTurnOrder |
	
	aCardManager := CardManager with: somePlayersNames using: aDeck.
	aMovementManager := MovementManager with: somePlayersNames and: anAmountOfLaps using: aBoard.
	diceCup := aDiceCup.
	counter := 1.
	turns := OrderedCollection new.
	somePlayersNames size timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	aTurnOrder := SequenceHandler with: turns.
	gameEventManager := GameEventManager with: aCardManager and: aMovementManager and: aTurnOrder.
]

{ #category : #playing }
GalaxyCircuitGame >> play: aCard From: aCardOwner to: aTargetShip [ 
	
	gameEventManager checkThat: aCardOwner has: aCard.
	aCard playIn: gameEventManager from: aCardOwner to: aTargetShip.
	gameEventManager remove: aCard from: aCardOwner.
	gameEventManager updateLastCardPlayed: aCard.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	gameEventManager checkThereIsNoWinner.
	gameEventManager moveCurrentTurnPlayer: diceCup throw.
	gameEventManager applyEffectToCurrentTurnPlayer.
	gameEventManager updateTurn.
]

{ #category : #accessing }
GalaxyCircuitGame >> shipLaps [

	^ gameEventManager shipLaps.
]

{ #category : #accessing }
GalaxyCircuitGame >> shipPositions [

	^ gameEventManager shipPositions.
]

{ #category : #'game status' }
GalaxyCircuitGame >> shipRanking [

	^ gameEventManager shipRanking.
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ gameEventManager winner.
]
