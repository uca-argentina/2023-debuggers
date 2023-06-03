Class {
	#name : #HyperJumpSquare,
	#superclass : #Object,
	#instVars : [
		'sequence'
	],
	#classInstVars : [
		'parsecs',
		'collectionSquares'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
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
	
	| steps |
	
	steps := (sequence next) * (aGame parsecSize).
	aGame updatePosition: steps.
	
]

{ #category : #initialization }
HyperJumpSquare >> initializeWith: someValues [

	sequence := SequenceHandler with: someValues.
]
