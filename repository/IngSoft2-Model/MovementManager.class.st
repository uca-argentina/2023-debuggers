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

{ #category : #'instance creation' }
MovementManager class >> with: somePlayersNames and: anAmountOfLaps using: aBoard [

	^ (self new) initializeWith: somePlayersNames and: anAmountOfLaps using: aBoard.
]

{ #category : #'applying effects' }
MovementManager >> applyAtomicBomb [

	ships do: [ :aShip | aShip resetPosition ].
]

{ #category : #'applying effects' }
MovementManager >> applyEffectTo: aTargetShip in: aGameEventManager [
	
	| landedSquare |
	
	landedSquare := ((ships at: aTargetShip) position).
	board effectTo: aTargetShip at: landedSquare truncated in: aGameEventManager.
]

{ #category : #'applying effects' }
MovementManager >> applyMoonwalk: steps to: aTargetShip [

	ships withIndexDo: [ :aShip :aShipTurnOrder | 
		aShipTurnOrder = aTargetShip ifFalse: [ 
			aShip move: steps. 
			self updateLapTo: aShip ] ].
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

	| lapAdded newPosition landedSquare|
	
	landedSquare := (aShip position) truncated.
	(board outOfBoardBounds: landedSquare) ifFalse: [ ^ self ].
	lapAdded := (landedSquare / board size) floor.
	newPosition := aShip position % board size.
	(newPosition >= 0 and: newPosition < 1) ifTrue: [ 
		newPosition := board size + newPosition .
		lapAdded := lapAdded - 1 ].
	
	aShip moveLaps: lapAdded and: newPosition

]

{ #category : #playing }
MovementManager >> updateParsecs: parsecSteps to: aTargetShip [

	| turnShip steps |
	turnShip := ships at: aTargetShip.
	steps := board parsecMovementToSquare: parsecSteps.
	turnShip move: steps.
	
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
