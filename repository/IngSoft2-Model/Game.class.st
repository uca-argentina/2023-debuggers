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
		'laps',
		'parsecSize',
		'hyperJumpValues'
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
Game class >> checkSquares: someSquares [
	
	(someSquares isEmpty) ifTrue: [ Error signal: 'Amount of squares cannot be 0' ]
]

{ #category : #'instance creation' }
Game class >> with: someShips and: someSquares and: anAmountOfLaps and: aParsecSize and: someValues uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkSquares: someSquares.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: someShips and: someSquares and: anAmountOfLaps and: aParsecSize and: someValues uses: aDiceCup).
]

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares and: anAmountOfLaps and: aParsecSize uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkSquares: anAmountOfSquares.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: someShips and: anAmountOfSquares and: anAmountOfLaps and: aParsecSize uses: aDiceCup).
]

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares and: anAmountOfLaps uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkSquares: anAmountOfSquares.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: someShips and: anAmountOfSquares and: anAmountOfLaps  uses: aDiceCup).
]

{ #category : #'as yet unclassified' }
Game >> applyAtomicBomb [

	shipPositions removeAll.
	ships do: [ :aShip | shipPositions add: 1 ].
]

{ #category : #'as yet unclassified' }
Game >> applyEffect [
	
	| landedSquare |
	
	landedSquare := squares at: (shipPositions at: currentTurn).
	landedSquare effect: self.
]

{ #category : #'as yet unclassified' }
Game >> applyMoonwalk [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition - 4).
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (squares size).
		shipLaps at: currentTurn put: turnShipLap - 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #'as yet unclassified' }
Game >> applyMoonwalk: steps [

	shipPositions withIndexDo: [ :aShipPosition :aShipToMove | 
		aShipToMove = currentTurn ifFalse: [ 
			self moonwalk: steps to: aShipToMove ] ].
]

{ #category : #'as yet unclassified' }
Game >> applySpeedUp [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition + 4).
	[ destination > (squares size)] whileTrue: [ 
		destination := destination - (squares size).
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #'as yet unclassified' }
Game >> applyWormhole [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition - 4).
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (squares size).
		shipLaps at: currentTurn put: turnShipLap - 1 ].
	shipPositions at: currentTurn put: destination.
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
Game >> initializeWith: someShips and: someSquares and: anAmountOfLaps and: aParsecSize and: someValues uses: aDiceCup [ 
	ships := someShips.
	squares := someSquares.
	laps := anAmountOfLaps.
	parsecSize := aParsecSize.
	hyperJumpValues := someValues.
	diceCup 	:= aDiceCup.
	currentTurn := 1.
	shipPositions := OrderedCollection new.
	ships do: [ :aShip | shipPositions add: 1 ].
	shipLaps := shipPositions copy.
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

{ #category : #'as yet unclassified' }
Game >> moonwalk: steps to: shipToMove [
	
	| destination shipLap shipPosition |
	
	shipPosition := shipPositions at: shipToMove.
	shipLap := shipLaps at: shipToMove.
	destination := (shipPosition - steps).
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (squares size).
		shipLaps at: shipToMove put: shipLap - 1 ].
	shipPositions at: shipToMove put: destination.
]

{ #category : #playing }
Game >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition.
	self applyEffect.
	self updateTurn
]

{ #category : #accessing }
Game >> shipLaps [
	^ shipLaps
]

{ #category : #accessing }
Game >> shipPositions [

	^ shipPositions.
]

{ #category : #'as yet unclassified' }
Game >> squaresToParsecs [
	| collection parsecs newCollection |
	newCollection := OrderedCollection new.
	collection := effect haveCollectionOfHyperJumpSquares.
	parsecs := effect haveParsecs.
	collection do: [ :anElement | newCollection add: (anElement * parsecs)  ].
	currentIndex := 1.
	^ newCollection.
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
	destination := (turnShipPosition + (diceCup throw)).
	[ destination > (squares size)] whileTrue: [ 
		destination := destination - (squares size).
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination.
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
