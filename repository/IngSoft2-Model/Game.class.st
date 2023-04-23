Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'ships',
		'board',
		'dice'
	],
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares [ 
	^((self new) initializeWith: someShips and: anAmountOfSquares).
]

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares uses: someDice [ 
	^((self new) initializeWith: someShips and: anAmountOfSquares uses: someDice).
]

{ #category : #'as yet unclassified' }
Game >> hasAWinner [

	^ ships anySatisfy: [ :aShip | aShip isWinner: board ]. 
]

{ #category : #initialization }
Game >> initializeWith: someShips and: anAmountOfSquares [ 
	ships := someShips.
	board := anAmountOfSquares.
]

{ #category : #initialization }
Game >> initializeWith: someShips and: anAmountOfSquares uses: someDice [
	ships := someShips.
	board := anAmountOfSquares.
	dice 	:= someDice. 
]

{ #category : #testing }
Game >> isFinished [
	^ true.
]

{ #category : #initialization }
Game >> isStarted [
	^true.
]

{ #category : #playing }
Game >> play [

	self validatePlay.
	[ self hasAWinner ] whileFalse: [ self playARound ]
]

{ #category : #playing }
Game >> playARound [

	ships do: [ :aShip | self playTurnOf: aShip].
]

{ #category : #playing }
Game >> playTurnOf: aShip [
	
	(self hasAWinner) ifFalse: [ aShip move: (self throwDice) in: board ]. 
]

{ #category : #'as yet unclassified' }
Game >> shipPositions [

	^ships collect: [ :aShip | aShip position ].
]

{ #category : #playing }
Game >> throwDice [
	
	^ dice sum: [ :aDie | aDie throw].
]

{ #category : #playing }
Game >> validatePlay [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #'as yet unclassified' }
Game >> winner [

	^ ships detect: [ :aShip | aShip isWinner: board ]
]
