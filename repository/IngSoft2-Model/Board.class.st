Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'lastSquareLanded',
		'squares',
		'parsecs'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Board class >> checkParsecs: anAmountOfAUnit [
	
	(anAmountOfAUnit convertToParsec < 1) ifTrue: [ Error signal: 'Amount of parsecs cannot be 0 or lower' ]
]

{ #category : #validation }
Board class >> checkSquares: someSquares [
	
	(someSquares isEmpty) ifTrue: [ Error signal: 'Amount of squares cannot be 0' ]
]

{ #category : #validation }
Board class >> checkSquares: someSquares and: anAmountOfAUnit [
	
	((anAmountOfAUnit convertToParsec % someSquares size) = 0) ifFalse: [ Error signal: 'Amount of parsecs must be divisible by the amount of squares' ]
]

{ #category : #'instance creation' }
Board class >> with: someSquares and: anAmountOfAUnit [

	self checkSquares: someSquares.
	self checkParsecs: anAmountOfAUnit.
	self checkSquares: someSquares and: anAmountOfAUnit.
	^ self new initializeWith: someSquares and: anAmountOfAUnit.
]

{ #category : #initialization }
Board >> effectTo: aTargetShip at: aSquareIndex in: aGameEventManager [
	
	lastSquareLanded := squares at: aSquareIndex.
	lastSquareLanded effectTo: aTargetShip in: aGameEventManager.
	
]

{ #category : #initialization }
Board >> initializeWith: someSquares and: anAmountOfAUnit [

	squares := someSquares.
	lastSquareLanded := NoEffectSquare new.
	parsecs := anAmountOfAUnit convertToParsec.
]

{ #category : #accessing }
Board >> lastSquareLanded [
	
	^ lastSquareLanded.
]

{ #category : #actions }
Board >> nonSquareMovementToSquareMovement: aNonSquareMovement [

	^ ((aNonSquareMovement convertToParsec) / self parsecsPerSquare).
]

{ #category : #'boundary check' }
Board >> outOfBoardBounds: aPosition [ 

	^ aPosition > (squares size) or: aPosition < 1
]

{ #category : #accessing }
Board >> parsecs [
	^ parsecs
]

{ #category : #actions }
Board >> parsecsPerSquare [

	^ parsecs / squares size
]

{ #category : #accessing }
Board >> size [
	
	^ (squares size)
]
