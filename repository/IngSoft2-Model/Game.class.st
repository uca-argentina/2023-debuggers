Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'ships',
		'squares',
		'diceCup'
	],
	#classInstVars : [
		'ships',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Game class >> checkForDuplicated: aCollectionOfShips [
	
	aCollectionOfShips do: [ :aShip | ((aCollectionOfShips select: [:anotherShip | anotherShip name == aShip name]) size >= 2) ifTrue:[Error signal: 'Ship alredy exists with that name']].
]

{ #category : #validation }
Game class >> checkSquares: anAmountOfSquares [
	
	(anAmountOfSquares <= 0) ifTrue: [ Error signal: 'Amount of squares should have no squares or less' ]
]

{ #category : #'instance creation' }
Game class >> with: someShips and: anAmountOfSquares uses: aDiceCup [ 
	self checkForDuplicated: someShips.
	self checkSquares: anAmountOfSquares.
	^((self new) initializeWith: someShips and: anAmountOfSquares uses: aDiceCup).
]

{ #category : #'game status' }
Game >> hasAWinner [

	^ ships anySatisfy: [ :aShip | aShip isWinner: squares ]. 
]

{ #category : #initialization }
Game >> initializeWith: someShips and: anAmountOfSquares uses: aDiceCup [
	ships := someShips.
	squares := anAmountOfSquares.
	diceCup 	:= aDiceCup. 
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
	
	(self hasAWinner) ifFalse: [ aShip move: (self useDiceCup) in: squares ]. 
]

{ #category : #'game status' }
Game >> shipPositions [

	^ships collect: [ :aShip | aShip position ].
]

{ #category : #playing }
Game >> useDiceCup [

	^ diceCup useDiceCup.

]

{ #category : #playing }
Game >> validatePlay [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #'game status' }
Game >> winner [

	^ ships detect: [ :aShip | aShip isWinner: squares ]
]
