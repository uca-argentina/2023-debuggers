Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'sequenceHandler'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #validation }
LoadedDie class >> checkAmountOfFaces: aSequenceOfRolls [

	aSequenceOfRolls
		detect: [ :aRoll | aRoll <= 0 ]
		ifFound: [ 
		Error signal: 'Unable to create dice with 0 or less faces' ]
]

{ #category : #'instance creation' }
LoadedDie class >> with: aSequenceOfRolls [

	self checkAmountOfFaces: aSequenceOfRolls.
	^ self new initializeWith: aSequenceOfRolls
]

{ #category : #accessing }
LoadedDie >> faces [
	^ (sequenceHandler sequence) max.
]

{ #category : #initialization }
LoadedDie >> initializeWith: aSequenceOfRolls [

	sequenceHandler := SequenceHandler with: aSequenceOfRolls.
]

{ #category : #'dice rolling' }
LoadedDie >> throw [

	^ (sequenceHandler next).
]
