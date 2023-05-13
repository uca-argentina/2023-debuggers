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

	aCollectionOfShips do: [ :aShip | 
		(aCollectionOfShips count: [ :anotherShip | 
			 aShip equals: anotherShip ]) >= 2 ifTrue: [ 
			Error signal: 'Ship already exists with that name' ] ]
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

{ #category : #playing }
Game >> checkThereIsNoWinner [

	self hasAWinner ifTrue: [ Error signal: 'Unable to play, Game has already finished' ]
]

{ #category : #'game status' }
Game >> hasAWinner [

	^ ships anySatisfy: [ :aShip | aShip isAt: squares ]. 
]

{ #category : #initialization }
Game >> initializeWith: someShips and: anAmountOfSquares uses: aDiceCup [
	ships := someShips.
	squares := anAmountOfSquares.
	diceCup 	:= aDiceCup. 
]

{ #category : #playing }
Game >> play [

	self checkThereIsNoWinner.
	[ self hasAWinner ] whileFalse: [ self playARound ]
]

{ #category : #playing }
Game >> playARound [

	ships do: [ :aShip | self playTurnOf: aShip].
]

{ #category : #playing }
Game >> playTurnOf: aShip [
	
	(self hasAWinner) ifFalse: [ aShip move: (self throw) in: squares ]. 
]

{ #category : #'game status' }
Game >> shipPositions [

	^ships collect: [ :aShip | aShip position ].
]

{ #category : #playing }
Game >> throw [

	^ diceCup throw.

]

{ #category : #'game status' }
Game >> winner [

	^ ships detect: [ :aShip | aShip isAt: squares ]
]
