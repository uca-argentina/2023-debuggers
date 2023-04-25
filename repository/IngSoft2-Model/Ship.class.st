Class {
	#name : #Ship,
	#superclass : #Object,
	#instVars : [
		'position',
		'name'
	],
	#classInstVars : [
		'position',
		'nameList'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Ship class >> with: aName [

	^((self new) intializeWith: aName).
]

{ #category : #initialize }
Ship >> intializeWith: aName [ 
	name := aName.
	position := 0.
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
	destination > squares
		ifTrue: [ self move: squares - position ]
		ifFalse: [ 
			destination < 0
				ifTrue: [ self move: position negated ]
				ifFalse: [ self move: anAmountOfSquares ] ]
]

{ #category : #accessing }
Ship >> name [
	^ name.
]

{ #category : #accessing }
Ship >> position [
	^ position.
]
