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
		'turnOrder',
		'deck',
		'permanentCards'
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

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup [ 
	self checkForDuplicated: somePlayersName.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup).
]

{ #category : #'instance creation' }
GalaxyCircuitGame class >> with: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [
	self checkForDuplicated: somePlayersName.
	self checkLaps: anAmountOfLaps.
	^((self new) initializeWith: somePlayersName and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck).
]

{ #category : #'card effects' }
GalaxyCircuitGame >> addToPermanentPile: aCardEffect [

	permanentCards add: aCardEffect.
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
			self updateLapTo: aShip ] ].
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkOwner: cardOwner [

	(cardOwner = currentTurn) ifFalse: [ Error signal: 'Unable to play permanent card when its not your turn' ]
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkPlayed: aCard from: aCardOwner [

	(aCardOwner = currentTurn or: aCard playableOnAnyTurn) ifFalse: [ Error signal: 'Unable to play permanent card when its not your turn' ]
]

{ #category : #'as yet unclassified' }
GalaxyCircuitGame >> checkThat: aCardOwner has: aCard [
	
	| cardOwner |
	
	cardOwner := ships at: aCardOwner.
	
	(cardOwner has: aCard) ifFalse: [ Error signal: 'Unable to play card when the player does not own the card' ]
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
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps uses: aDiceCup [

	| counter turns |
	
	ships := somePlayersNames collect: [ :aName | Ship with: aName ].
	board := aBoard.
	laps := anAmountOfLaps.
	diceCup := aDiceCup.
	counter := 1.
	turns := OrderedCollection new.
	(ships size) timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	turnOrder := SequenceHandler with: turns.
	currentTurn := turnOrder next.
]

{ #category : #initialization }
GalaxyCircuitGame >> initializeWith: somePlayersNames and: aBoard and: anAmountOfLaps uses: aDiceCup uses: aDeck [

	| counter turns |
	
	deck := aDeck.
	ships := somePlayersNames collect: [ :aName | 
		         | aStartingHand |
		         aStartingHand := OrderedCollection new.
		         aStartingHand add: aDeck draw.
		         aStartingHand add: aDeck draw.
		         Ship with: aName and: aStartingHand ].
	board := aBoard.
	laps := anAmountOfLaps.
	diceCup := aDiceCup.
	permanentCards := OrderedCollection new.
	counter := 1.
	turns := OrderedCollection new.
	ships size timesRepeat: [ 
		turns add: counter.
		counter := counter + 1 ].
	turnOrder := SequenceHandler with: turns.
	currentTurn := turnOrder next
]

{ #category : #playing }
GalaxyCircuitGame >> play: aCard from: aCardOwner to: targetShip [ 
	
	self checkThat: aCardOwner has: aCard.
	self checkPlayed: aCard from: aCardOwner.
	aCard use: self to: targetShip.
]

{ #category : #playing }
GalaxyCircuitGame >> playTurn [

	self checkThereIsNoWinner.
	self updatePosition: (diceCup throw + (self usePermanentCards)).
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
	
	ranking := ships sort: [ :aShip :anotherShip | (((aShip lap) * board size) + aShip position) >= (((anotherShip lap) * board size) + anotherShip position) ].
	^ ranking
]

{ #category : #playing }
GalaxyCircuitGame >> updateLapTo: aShip [

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
GalaxyCircuitGame >> updateParsecs: parsecSteps [

	| turnShip steps |
	turnShip := ships at: currentTurn.
	steps := board parsecMovementToSquare: ((parsecSteps + turnShip parsec) - 1).
	steps := steps > 0
		         ifTrue: [ steps truncated ]
		         ifFalse: [ steps floor ].
	turnShip move: steps.
	turnShip parsecMove: (board checkParsecLandedWith: parsecSteps).
	self updateLapTo: turnShip
]

{ #category : #playing }
GalaxyCircuitGame >> updatePosition: steps [

	| turnShip |
	
	turnShip := ships at: currentTurn.
	turnShip move: steps.
	self updateLapTo: turnShip.
]

{ #category : #playing }
GalaxyCircuitGame >> updateTurn [

	currentTurn := turnOrder next.
]

{ #category : #'card effects' }
GalaxyCircuitGame >> usePermanentCards [
	
	^ permanentCards sumNumbers: [ :aPermanentCard | aPermanentCard applyTo: currentTurn ]
]

{ #category : #'game status' }
GalaxyCircuitGame >> winner [

	^ ships detect: [ :aShip | aShip lap > laps ] ifNone: [ ^ nil ]
]
