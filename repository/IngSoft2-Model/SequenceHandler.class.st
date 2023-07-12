Class {
	#name : #SequenceHandler,
	#superclass : #Object,
	#instVars : [
		'sequence'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SequenceHandler class >> with: aCollectionOfValues [
	^ ((self new) initializeWith: aCollectionOfValues).
]

{ #category : #'sequence handling' }
SequenceHandler >> current [

	| currentValue |
	
	currentValue := sequence at: 1.
	^ currentValue
]

{ #category : #initialization }
SequenceHandler >> initializeWith: aCollectionOfValues [ 
	sequence := aCollectionOfValues.
]

{ #category : #'sequence handling' }
SequenceHandler >> next [

	| currentValue |
	
	currentValue := sequence removeFirst.
	sequence add: currentValue.
	^ currentValue
]
