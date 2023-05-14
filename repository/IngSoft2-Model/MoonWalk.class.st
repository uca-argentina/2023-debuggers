Class {
	#name : #MoonWalk,
	#superclass : #Object,
	#instVars : [
		'backwards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
MoonWalk >> checkForValidNumberOfSquares: aNumber [ 
	(aNumber <= 0) ifTrue: [ Error signal: 'Amount of squares cannot be 0 or lower' ].
]

{ #category : #accessing }
MoonWalk >> position [
	^ backwards negated.
]

{ #category : #accessing }
MoonWalk >> typeOfEffect [
	^'MoonWalk'.
]

{ #category : #'instance creation' }
MoonWalk >> with: aNumberOfSquares [
	self checkForValidNumberOfSquares: aNumberOfSquares .
	backwards := aNumberOfSquares.
	self position.
	
]
