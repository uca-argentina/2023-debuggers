Class {
	#name : #MovementManager,
	#superclass : #Object,
	#instVars : [
		'ships',
		'board',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MovementManager class >> with: somePlayersNames and: anAmountOfLaps using: aBoard [

	^ (self new) initializeWith: somePlayersNames and: anAmountOfLaps using: aBoard.
]

{ #category : #'applying effects' }
MovementManager >> applyAtomicBomb [

	ships do: [ :aShip | aShip resetPosition ].
]

{ #category : #'applying effects' }
MovementManager >> applyEffectTo: aTargetShip [
	
	| landedSquare |
	
	landedSquare := (ships at: aTargetShip) position.
	board effectTo: aTargetShip at: landedSquare in: self.
]

{ #category : #'applying effects' }
MovementManager >> applyMoonwalk: steps to: aTargetShip [

	ships withIndexDo: [ :aShip :aShipTurnOrder | 
		aShipTurnOrder = aTargetShip ifFalse: [ 
			aShip move: steps. 
			self updateLapTo: aShip ] ].
]

{ #category : #validation }
MovementManager >> checkThereIsNoWinner [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #testing }
MovementManager >> hasAWinner [

	^ ships anySatisfy: [ :aShip | (aShip lap) > laps ]. 
]

{ #category : #initialization }
MovementManager >> initializeWith: somePlayersNames and: anAmountOfLaps using: aBoard [

	ships := somePlayersNames collect: [ :aName | 
		         Ship with: aName.].
	board := aBoard.
	laps := anAmountOfLaps.
]

{ #category : #accessing }
MovementManager >> lastSquareLanded [

	^ board lastSquareLanded.
]

{ #category : #accessing }
MovementManager >> shipLaps [
	^ ships collect: [ :aShip | aShip lap].
]

{ #category : #accessing }
MovementManager >> shipPositions [

	^ ships collect: [ :aShip | aShip position].
]

{ #category : #'game status' }
MovementManager >> shipRanking [

	| ranking |
	
	ranking := ships sort: [ :aShip :anotherShip | (((aShip lap) * board size) + aShip position) >= (((anotherShip lap) * board size) + anotherShip position) ].
	^ ranking
]

{ #category : #playing }
MovementManager >> updateLapTo: aShip [

	| lapAdded newPosition |
	
	(board outOfBoardBounds: aShip position) ifFalse: [ ^ self ].
	lapAdded := (aShip position / board size) floor.
	newPosition := aShip position % board size.
	newPosition = 0 ifTrue: [ 
		newPosition := board size.
		lapAdded := lapAdded - 1 ].
	aShip moveLaps: lapAdded and: newPosition
]

{ #category : #playing }
MovementManager >> updateParsecs: parsecSteps to: aTargetShip [

	| turnShip steps |
	turnShip := ships at: aTargetShip.
	steps := board parsecMovementToSquare: ((parsecSteps + turnShip parsec) - 1).
	steps := steps > 0
		         ifTrue: [ steps truncated ]
		         ifFalse: [ steps floor ].
	turnShip move: steps.
	turnShip parsecMove: (board checkParsecLandedWith: parsecSteps).
	self updateLapTo: turnShip
]

{ #category : #playing }
MovementManager >> updatePosition: steps to: aTargetShip [

	| targetShip |
	
	targetShip := ships at: aTargetShip.
	targetShip move: steps.
	self updateLapTo: targetShip.
]

{ #category : #'game status' }
MovementManager >> winner [

	^ ships detect: [ :aShip | aShip lap > laps ] ifNone: [ ^ nil ]
]
