Class {
	#name : #HyperJumpSquare,
	#superclass : #Object,
	#instVars : [
		'values'
	],
	#classInstVars : [
		'parsecs',
		'collectionSquares'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperJumpSquare class >> checkValuesAreInDescendingOrder: someValues [

	(someValues isSortedBy: [:a :b | a >= b ]) ifFalse: [ Error signal: 'The list of values must be in descending order' ].
]

{ #category : #validation }
HyperJumpSquare class >> checkValuesIsNotEmpty: someValues [

	(someValues isEmpty) ifTrue: [ Error signal: 'The list of values cannot be empty' ]
]

{ #category : #'instance creation' }
HyperJumpSquare class >> with: someValues [
	self checkValuesIsNotEmpty: someValues. 
	self checkValuesAreInDescendingOrder: someValues.
	^ (self new) initializeWith: someValues.
]

{ #category : #accessing }
HyperJumpSquare >> effect: aGame [
	
	| currentValue steps |
	
	currentValue := values removeFirst.
	steps := currentValue * (aGame parsecSize).
	aGame updatePosition: steps.
	values add: currentValue.
	
]

{ #category : #initialization }
HyperJumpSquare >> initializeWith: someValues [

	values := someValues.
]
