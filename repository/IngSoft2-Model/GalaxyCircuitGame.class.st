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
		'board',
		'turnOrder'
	],
	#classInstVars : [
		'ships',
		'board'
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

{ #category : #validation }
GalaxyCircuitGame class >> checkParsecs: aParsecSize [

	(aParsecSize <= 0) ifTrue: [ Error signal: 'Parsec size cannot be 0 or lower' ]
]

{ #category : #validation }
GalaxyCircuitGame class >> checkParsecs: aParsecSize and: aBoard [

	(((aBoard size) % aParsecSize) = 0) ifFalse: [ Error signal: 'Amount of squares must be propotional to the size of parsecs' ]
]

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: somePlayersName and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup [ 
	self checkForDuplicated: somePlayersName.
	self checkLaps: anAmountOfLaps.
	self checkParsecs: aParsecSize.
	self checkParsecs: aParsecSize and: aBoard.
	^((self new) initializeWith: somePlayersName and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup).
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyAtomicBomb [

	ships do: [ :aShip | aShip resetPosition ].
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyEffect [
	
	| landedSquare |
	
	landedSquare := ((ships at: currentTurn) position).
	board effectTo: self at: landedSquare.
]

{ #category : #'applying effects' }
GalaxyCircuitGame >> applyMoonwalk: steps [

	ships withIndexDo: [ :aShip :aShipTurnOrder | 
		aShipTurnOrder = currentTurn ifFalse: [ 
			aShip move: steps. 
			self updateLapTo: aShipTurnOrder ] ].
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

	^ ships anySatisfy: [ :aShip | (aShip lap) > laps ]. 
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps and: aParsecSize uses: aDiceCup [

	| counter turns |
	
	ships := somePlayersNames collect: [ :aName | Ship with: aName ].
	board := aBoard.
	laps := anAmountOfLaps.
	parsecSize := aParsecSize.
	diceCup := aDiceCup.
	counter := 1.
	turns := OrderedCollection new.
	(ships size) timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	turnOrder := SequenceHandler with: turns.
	currentTurn := turnOrder next.
]

{ #category : #accessing }
GalaxyCircuitGame >> parsecSize [

	^ parsecSize.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition: diceCup throw.
	self applyEffect.
	self updateTurn
]

{ #category : #accessing }
GalaxyCircuitGame >> shipLaps [
	^ ships collect: [ :aShip | aShip lap].
]

{ #category : #accessing }
GalaxyCircuitGame >> shipPositions [

	^ ships collect: [ :aShip | aShip position].
]

{ #category : #'game status' }
GalaxyCircuitGame >> shipRanking [

	| ranking |
	
	ranking := ships sort: [ :aShip :anotherShip | (aShip advancedSquares) >= (anotherShip advancedSquares) ].
	^ ranking
]

{ #category : #playing }
GalaxyCircuitGame >> updateLap [

	| currentShip |
	currentShip := ships at: currentTurn.
	(board outOfBoardBounds: currentShip position) ifTrue: [ 
		| lapAdded newPosition |
		lapAdded := (currentShip position / board size) floor.
		newPosition := currentShip position % board size.
		currentShip moveLaps: lapAdded and: newPosition ]

]

{ #category : #playing }
GalaxyCircuitGame >> updateLapTo: aTurn [

	| currentShip |
	currentShip := ships at: aTurn.
	(board outOfBoardBounds: currentShip position) ifTrue: [ 
		| lapAdded newPosition |
		lapAdded := (currentShip position / board size) floor.
		newPosition := currentShip position % board size.
		currentShip moveLaps: lapAdded and: newPosition ]

]

{ #category : #playing }
GalaxyCircuitGame >> updatePosition: steps [

	| turnShip |
	
	turnShip := ships at: currentTurn.
	turnShip move: steps.
	self updateLap.
]

{ #category : #playing }
GalaxyCircuitGame >> updateTurn [

	currentTurn := turnOrder next.
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ ships detect: [ :aShip | aShip lap > laps ] ifNone: [ ^ nil ]
]
