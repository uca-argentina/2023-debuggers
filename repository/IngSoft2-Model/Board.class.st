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
Board class >> checkParsecs: anAmountOfParsecs [
	
	(anAmountOfParsecs < 1) ifTrue: [ Error signal: 'Amount of parsecs cannot be 0 or lower' ]
]

{ #category : #validation }
Board class >> checkSquares: someSquares [
	
	(someSquares isEmpty) ifTrue: [ Error signal: 'Amount of squares cannot be 0' ]
]

{ #category : #validation }
Board class >> checkSquares: someSquares and: anAmountOfParsecs [
	
	((anAmountOfParsecs % someSquares size) = 0) ifFalse: [ Error signal: 'Amount of parsecs must be divisible by the amount of squares' ]
]

{ #category : #'instance creation' }
Board class >> with: someSquares and: anAmountOfParsecs [

	self checkSquares: someSquares.
	self checkParsecs: anAmountOfParsecs.
	self checkSquares: someSquares and: anAmountOfParsecs.
	^ self new initializeWith: someSquares and: anAmountOfParsecs.
]

{ #category : #actions }
Board >> checkParsecLandedWith: parsecSteps [

	^ ((parsecSteps % self parsecsPerSquare) + 1).
]

{ #category : #initialization }
Board >> effectTo: aTargetShip at: aSquareIndex in: aMovementManager [
	
	lastSquareLanded := squares at: aSquareIndex.
	lastSquareLanded effectTo: aTargetShip in: aMovementManager.
	
]

{ #category : #initialization }
Board >> initializeWith: someSquares and: anAmountOfParsecs [

	squares := someSquares.
	lastSquareLanded := NoEffectSquare new.
	parsecs := anAmountOfParsecs.
]

{ #category : #accessing }
Board >> lastSquareLanded [
	
	^ lastSquareLanded.
]

{ #category : #'boundary check' }
Board >> outOfBoardBounds: aPosition [ 
	^ aPosition > (squares size) or: aPosition < 1
]

{ #category : #actions }
Board >> parsecMovementToSquare: aParsecMovement [

	^ (aParsecMovement / self parsecsPerSquare).
]

{ #category : #actions }
Board >> parsecsPerSquare [

	^ parsecs / squares size
]

{ #category : #accessing }
Board >> size [
	
	^ (squares size)
]
