Class {
	#name : #SquareGenerator,
	#superclass : #Object,
	#instVars : [
		'squaresToGenerate',
		'squaresToUse',
		'distribution'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
SquareGenerator class >> checkAmountOfSquares: anAmountOfSquares [
	
	(anAmountOfSquares <= 0) ifTrue: [ Error signal: 'Amount of squares cannot be 0 or lower' ]
]

{ #category : #validation }
SquareGenerator class >> checkDistribution: someDistribution [
	((someDistribution sum) = 100) ifFalse: [ Error signal: 'Distribution must add up 100%' ].
]

{ #category : #validation }
SquareGenerator class >> checkTypesOfSquares: someSquares [

	(someSquares isEmpty ) ifTrue:[Error signal: 'Cannot generate wihtout any type of square']
]

{ #category : #'instance creation' }
SquareGenerator class >> with: anAmountOfSquares of: someSquares using: someDistribution [
	self checkAmountOfSquares: anAmountOfSquares.
	self checkDistribution:  someDistribution.
	self checkTypesOfSquares:  someSquares.
	^ ((self new) initializeWith: anAmountOfSquares of: someSquares using: someDistribution).
]

{ #category : #Generation }
SquareGenerator >> generateNumber [
	^ 100 atRandom.
]

{ #category : #Generation }
SquareGenerator >> generateSquares [

	| squares squareSelector floor ceiling |
	squares := OrderedCollection new.
	squaresToGenerate timesRepeat: [ 
		floor := 1.
		ceiling := 0.
		squareSelector := self generateNumber.
		distribution withIndexDo: [ :currentDistribution :generatedIndex | 
			ceiling := ceiling + currentDistribution.
			(squareSelector between: floor and: ceiling) ifTrue: [ 
				squares add: (squaresToUse at: generatedIndex) ].
			floor := floor + currentDistribution ] ].
	^ squares
]

{ #category : #initialization }
SquareGenerator >> initializeWith: anAmountOfSquares of: someSquares using: someDistribution [

	squaresToGenerate := anAmountOfSquares.
	squaresToUse := someSquares.
	distribution := someDistribution.
]
