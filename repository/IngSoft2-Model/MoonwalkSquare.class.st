Class {
	#name : #MoonwalkSquare,
	#superclass : #Square,
	#instVars : [
		'backwards',
		'steps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MoonwalkSquare class >> checkAmountOfSteps: anAmountOfSteps [

	(anAmountOfSteps <= 0) ifTrue: [ Error signal: 'Amount of steps cannot be 0 or lower' ]
]

{ #category : #'instance creation' }
MoonwalkSquare class >> with: anAmountOfSteps [
	self checkAmountOfSteps: anAmountOfSteps.
	^ (self new) initializeWith: anAmountOfSteps.
]

{ #category : #accessing }
MoonwalkSquare >> effect: aGame [

	aGame applyMoonwalk: steps.
]

{ #category : #initialization }
MoonwalkSquare >> initializeWith: anAmountOfSteps [

	steps := anAmountOfSteps.
]
