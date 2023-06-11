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

{ #category : #accessing }
SequenceHandler >> current [

	^ sequence first.
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

{ #category : #accessing }
SequenceHandler >> sequence [
	^ sequence
]
