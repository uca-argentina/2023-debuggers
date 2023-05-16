Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'squares'
	],
	#category : #'IngSoft2-Tests'
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
Board >> effectTo: aGame At: aSquareIndex [

	(squares at: aSquareIndex) effect: aGame.
]

{ #category : #initialization }
Board >> initializeWith: someSquares [

	squares := someSquares
]
