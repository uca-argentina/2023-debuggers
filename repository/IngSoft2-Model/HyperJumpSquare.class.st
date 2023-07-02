Class {
	#name : #HyperJumpSquare,
	#superclass : #Object,
	#instVars : [
		'parsecSteps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
HyperJumpSquare class >> checkValuesAreInDescendingOrder: someMovements [

	(someMovements isSortedBy: [:aMovement :anotherMovement | aMovement convertToParsec >= anotherMovement convertToParsec]) ifFalse: [ Error signal: 'The list of values must be in descending order' ].
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
HyperJumpSquare >> effectTo: aTargetShip in: aGameEventManager [
	
	aGameEventManager updateParsecs: parsecSteps next to: aTargetShip.
	
]

{ #category : #initialization }
HyperJumpSquare >> initializeWith: someValues [

	parsecSteps := SequenceHandler with: someValues.
]
