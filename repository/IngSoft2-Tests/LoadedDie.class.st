Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces',
		'currentRoll'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> with: aSequenceOfRolls [
	^(self new) initializeWith: aSequenceOfRolls.
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
