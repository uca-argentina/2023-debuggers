Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'ships',
		'squares',
		'diceCup',
		'currentTurn',
		'shipPositions',
		'shipLaps',
		'laps'
	],
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Game class >> checkForDuplicated: aCollectionOfShips [

	aCollectionOfShips do: [ :aShip | 
		(aCollectionOfShips count: [ :anotherShip | 
			 aShip equals: anotherShip ]) >= 2 ifTrue: [ 
			Error signal: 'Ship already exists with that name' ] ]
]

{ #category : #validation }
Game class >> checkLaps: anAmountOfLaps [ 

	(anAmountOfLaps <= 0) ifTrue: [ Error signal: 'Amount of laps cannot be 0 or lower' ]
]

{ #category : #validation }
Game class >> checkSquares: anAmountOfSquares [
	
	(anAmountOfSquares <= 0) ifTrue: [ Error signal: 'Amount of squares cannot be 0 or lower' ]
]

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares and: anAmountOfLaps uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkSquares: anAmountOfSquares.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: someShips and: anAmountOfSquares and: anAmountOfLaps  uses: aDiceCup).
]

{ #category : #validation }
Game >> checkThereIsNoWinner [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #accessing }
Game >> currentTurn [
	^ currentTurn
]

{ #category : #'game status' }
Game >> hasAWinner [

	^ shipLaps anySatisfy: [ :aShipLap | aShipLap > laps ]. 
]

{ #category : #initialization }
Game >> initializeWith: someShips and: anAmountOfSquares and: anAmountOfLaps uses: aDiceCup [
	ships := someShips.
	squares := anAmountOfSquares.
	laps := anAmountOfLaps.
	diceCup 	:= aDiceCup.
	currentTurn := 1.
	shipPositions := OrderedCollection new.
	ships do: [ :aShip | shipPositions add: 1 ].
	shipLaps := shipPositions copy.
]

{ #category : #playing }
Game >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition.
	self updateTurn
]

{ #category : #accessing }
Game >> shipPositions [

	^ shipPositions.
]

{ #category : #playing }
Game >> throw [

	^ diceCup throw.

]

{ #category : #playing }
Game >> updatePosition [

	| turnShipPosition destination turnShipLap |
	
	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := turnShipPosition + diceCup throw.
	[ destination > squares ] whileTrue: [ 
		destination := destination - squares.
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination
]

{ #category : #playing }
Game >> updateTurn [

	currentTurn := currentTurn = shipPositions size
		               ifFalse: [ currentTurn + 1 ]
		               ifTrue: [ 1 ]
]

{ #category : #'game status' }
Game >> winner [

	shipLaps do: [ :aShipLap | 
		aShipLap > laps ifTrue: [ ^ ships at: (shipLaps indexOf: aShipLap) ] ].
	^ (Ship with: 'Nadie Gano')
]
