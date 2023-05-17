Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'currentRoll'
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
	^ faces max.
]

{ #category : #initialization }
LoadedDie >> initializeWith: aSequenceOfRolls [
	faces:=aSequenceOfRolls.
	currentRoll:=1.
]

{ #category : #'dice rolling' }
LoadedDie >> throw [

	| roll |
	roll := (faces at: currentRoll).
	(currentRoll == (faces size))
		ifTrue: [ currentRoll := 1 ]
		ifFalse: [ currentRoll := currentRoll + 1 ].

	^ roll.
]
