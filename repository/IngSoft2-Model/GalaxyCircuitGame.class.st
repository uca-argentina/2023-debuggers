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

	| aCardManager aMovementManager aTurnOrder |
	
	aCardManager := CardManager with: somePlayersNames using: aDeck.
	aMovementManager := MovementManager with: somePlayersNames and: anAmountOfLaps using: aBoard.
	aTurnOrder := SequenceHandler with: somePlayersNames.
	gameEventManager := GameEventManager with: aCardManager and: aMovementManager and: aTurnOrder using: aDiceCup.
]

{ #category : #playing }
GalaxyCircuitGame >> play: aCard from: aCardOwner to: aTargetShip [ 

	gameEventManager play: aCard from: aCardOwner to: aTargetShip
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [
	
	gameEventManager playTurn.
	
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
