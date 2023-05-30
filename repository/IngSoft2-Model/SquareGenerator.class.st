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

{ #category : #'instance creation' }
SquareGenerator class >> checkAmountOfSquares: anAmountOfSquares [
	
	(anAmountOfSquares <= 0) ifTrue: [ Error signal: 'Amount of squares cannot be 0 or lower' ]
]

{ #category : #'instance creation' }
SquareGenerator class >> with: anAmountOfSquares [
	self checkAmountOfSquares: anAmountOfSquares.
	^ self new initializeWith: anAmountOfSquares
]

{ #category : #'instance creation' }
SquareGenerator class >> with: anAmountOfSquares of: someSquares using: someDistribution [
	self checkAmountOfSquares: anAmountOfSquares.
	^ ((self new) initializeWith: anAmountOfSquares of: someSquares using: someDistribution).
]

{ #category : #Generation }
SquareGenerator >> generateNumber [
	^ 100 atRandom.
]

{ #category : #Generation }
SquareGenerator >> generateSquares [

	| squares squareSelector randomHyperJumpValues randomMoonwalkSteps |
	squares := OrderedCollection new.
	1 to: squaresToGenerate do: [ :i | 
		squareSelector := (self generateNumber).
		randomHyperJumpValues := OrderedCollection new.
		randomHyperJumpValues add: 5 atRandom.
		randomMoonwalkSteps := 7 atRandom.
		(squareSelector between: 1 and: 2) ifTrue: [ 
			squares add: (AtomicBombSquare new )].
		(squareSelector between: 3 and: 10) ifTrue: [ 
			squares add: (HyperJumpSquare with: randomHyperJumpValues) ].
		(squareSelector between: 11 and: 20) ifTrue: [ 
			squares add: (MoonwalkSquare with: randomMoonwalkSteps) ].
		(squareSelector between: 21 and: 40) ifTrue: [ 
			squares add: (SpeedUpSquare new )].
		(squareSelector between: 41 and: 60) ifTrue: [ 
			squares add: (WormholeSquare new )].
		(squareSelector between: 61 and: 100) ifTrue: [ 
			squares add: (NoEffectSquare new )] ].
	^ squares
]

{ #category : #Generation }
SquareGenerator >> generateSquaresNew [

	| squares squareSelector floor ceiling |
	squares := OrderedCollection new.
	1 to: squaresToGenerate do: [ :i | 
		floor := 1.
		ceiling := 0.
		squareSelector := self generateNumber.
		distribution withIndexDo: [ :currentDistribution :generatedIndex | 
			ceiling := ceiling + currentDistribution.
			(squareSelector between: floor and: ceiling) ifTrue: [ 
				squares add: (squaresToUse at: generatedIndex) ].
			floor := currentDistribution + 1 ] ].
	^ squares.
]

{ #category : #initialization }
SquareGenerator >> initializeWith: anAmountOfSquares [

	squaresToGenerate := anAmountOfSquares.
]

{ #category : #initialization }
SquareGenerator >> initializeWith: anAmountOfSquares of: someSquares using: someDistribution [

	squaresToGenerate := anAmountOfSquares.
	squaresToUse := someSquares.
	distribution := someDistribution.
]
