Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#classInstVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Ship class >> initializeWithPosition: aPosition [  
	position := aPosition.
]

{ #category : #'instance creation' }
Ship class >> withPosition: aPosition [
	^((self new) initializeWithPosition: aPosition).
]

{ #category : #intialization }
Ship >> initializeWithPosition: aPosition [  
	position := aPosition.
]

{ #category : #validation }
Ship >> isValid [
	^true.
]

{ #category : #testing }
Ship >> isWinner: aFinalSquare [ 
	^ position == aFinalSquare.
]

{ #category : #accessing }
Ship >> move: anAmountOfSteps [
	position := position + anAmountOfSteps.
]

{ #category : #accessing }
Ship >> move: anAmountOfSquares in: squares [

	| destination |
	destination := position + anAmountOfSquares.
	(destination > squares)
		ifTrue: [ self move: (squares - position) ]
		ifFalse: [ self move: anAmountOfSquares ]
]

{ #category : #accessing }
Ship >> position [
	^ position.
]
