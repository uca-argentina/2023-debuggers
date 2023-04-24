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

{ #category : #'instance creation' }
Ship class >> atZero [
	^((self new) initializeAtZero) .
]

{ #category : #initialization }
Ship class >> initializeWithPosition: aPosition [  
	position := aPosition .
]

{ #category : #'instance creation' }
Ship class >> withPosition: aPosition [
	^((self new) initializeWithPosition: aPosition ) .
]

{ #category : #initialization }
Ship >> initializeAtZero [
	position := 0.
]

{ #category : #initialization }
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

	anAmountOfSteps < 0 ifFalse: [ 
		position := position + anAmountOfSteps ]
	ifTrue:[position := 0].
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
