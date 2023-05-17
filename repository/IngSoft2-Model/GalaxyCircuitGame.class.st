Class {
	#name : #GalaxyCircuitGame,
	#superclass : #Object,
	#instVars : [
		'ships',
		'diceCup',
		'currentTurn',
		'shipPositions',
		'shipLaps',
		'laps',
		'parsecSize',
		'hyperJumpValues',
		'board'
	],
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
GalaxyCircuitGame class >> checkForDuplicated: aCollectionOfShips [

	aCollectionOfShips do: [ :aShip | 
		(aCollectionOfShips count: [ :anotherShip | 
			 aShip equals: anotherShip ]) >= 2 ifTrue: [ 
			Error signal: 'Ship already exists with that name' ] ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkLaps: anAmountOfLaps [ 

	(anAmountOfLaps <= 0) ifTrue: [ Error signal: 'Amount of laps cannot be 0 or lower' ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkParsecs: aParsecSize [

	(aParsecSize <= 0) ifTrue: [ Error signal: 'Parsec size cannot be 0 or lower' ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkParsecs: aParsecSize and: aBoard [

	(((aBoard size) % aParsecSize) = 0) ifFalse: [ Error signal: 'Amount of squares must be propotional to the size of parsecs' ]
]

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: someShips and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkLaps: anAmountOfLaps.
	self checkParsecs: aParsecSize.
	self checkParsecs: aParsecSize and: aBoard.
	^((self new) initializeWith: someShips and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup).
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyAtomicBomb [

	shipPositions removeAll.
	ships do: [ :aShip | shipPositions add: 1 ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyEffect [
	
	| landedSquare |
	
	landedSquare := (shipPositions at: currentTurn).
	board effectTo: self at: landedSquare.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyHyperJump: value [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition + (parsecSize * value)).
	[ destination > (board size)] whileTrue: [ 
		destination := destination - (board size).
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyMoonwalk: steps [

	shipPositions withIndexDo: [ :aShipPosition :aShipToMove | 
		aShipToMove = currentTurn ifFalse: [ 
			self moonwalk: steps to: aShipToMove ] ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applySpeedUp [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition + 4).
	[ destination > (board size)] whileTrue: [ 
		destination := destination - (board size).
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyWormhole [

	| turnShipPosition destination turnShipLap |

	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition - 4).
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (board size).
		shipLaps at: currentTurn put: turnShipLap - 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #validation }
GalaxyCircuitGame >> checkThereIsNoWinner [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #accessing }
GalaxyCircuitGame >> currentTurn [
	^ currentTurn
]

{ #category : #'game status' }
GalaxyCircuitGame >> hasAWinner [

	^ shipLaps anySatisfy: [ :aShipLap | aShipLap > laps ]. 
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: someShips and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup [ 
	ships := someShips.
	board := aBoard.
	laps := anAmountOfLaps.
	parsecSize := aParsecSize.
	diceCup 	:= aDiceCup.
	currentTurn := 1.
	shipPositions := OrderedCollection new.
	ships do: [ :aShip | shipPositions add: 1 ].
	shipLaps := shipPositions copy.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> moonwalk: steps to: shipToMove [
	
	| destination shipLap shipPosition |
	
	shipPosition := shipPositions at: shipToMove.
	shipLap := shipLaps at: shipToMove.
	destination := (shipPosition - steps).
	[ destination < 1 ] whileTrue: [ 
		destination := destination + (board size).
		shipLaps at: shipToMove put: shipLap - 1 ].
	shipPositions at: shipToMove put: destination.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition.
	self applyEffect.
	self updateTurn
]

{ #category : #accessing }
GalaxyCircuitGame >> shipLaps [
	^ shipLaps
]

{ #category : #accessing }
GalaxyCircuitGame >> shipPositions [

	^ shipPositions.
]

{ #category : #'game status' }
GalaxyCircuitGame >> shipRanking [

	| shipSquaresAdvanced sortedByAdvanced ranking |
	shipSquaresAdvanced := shipPositions
		                       with: shipLaps
		                       collect: [ :aPosition :aLap | 
		                       aPosition + (board size * (aLap - 1)) ].
	sortedByAdvanced := shipSquaresAdvanced sort: [ :a :b | a <= b ].
	ranking := OrderedCollection new.
	sortedByAdvanced do: [ :anAmountOfAdvancedSquares | 
		ranking add:
			(ships at: (shipSquaresAdvanced indexOf: anAmountOfAdvancedSquares)) ].
	^ ranking
]

{ #category : #playing }
GalaxyCircuitGame >> throw [

	^ diceCup throw.

]

{ #category : #playing }
GalaxyCircuitGame >> updatePosition [

	| turnShipPosition destination turnShipLap |
	turnShipPosition := shipPositions at: currentTurn.
	turnShipLap := shipLaps at: currentTurn.
	destination := (turnShipPosition + (diceCup throw)).
	[ destination > (board size)] whileTrue: [ 
		destination := destination - (board size).
		shipLaps at: currentTurn put: turnShipLap + 1 ].
	shipPositions at: currentTurn put: destination.
]

{ #category : #playing }
GalaxyCircuitGame >> updateTurn [

	currentTurn := currentTurn = shipPositions size
		               ifFalse: [ currentTurn + 1 ]
		               ifTrue: [ 1 ]
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	shipLaps do: [ :aShipLap | 
		aShipLap > laps ifTrue: [ ^ ships at: (shipLaps indexOf: aShipLap) ] ].
	^ Ship with: 'Nadie Gano'
]
