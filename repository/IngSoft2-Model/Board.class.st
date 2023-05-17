Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'squares'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Board class >> checkSquares: someSquares [
	
	(someSquares isEmpty) ifTrue: [ Error signal: 'Amount of squares cannot be 0' ]
]

{ #category : #'instance creation' }
Board class >> with: someSquares [

	self checkSquares: someSquares.
	^ self new initializeWith: someSquares.
]

{ #category : #initialization }
Board >> effectTo: aGame at: aSquareIndex [

	(squares at: aSquareIndex) effect: aGame.
]

{ #category : #initialization }
Board >> initializeWith: someSquares [

	squares := someSquares
]

{ #category : #accessing }
Board >> size [
	
	^ (squares size)
]
