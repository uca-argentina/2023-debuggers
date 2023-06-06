Class {
	#name : #CardEffect,
	#superclass : #Object,
	#instVars : [
		'card',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardEffect class >> with: aCard to: targetShip [

	^(self new) initializeWith: aCard to: targetShip.
]

{ #category : #operations }
CardEffect >> applyTo: targetShip [
	
	(card applyAll or: (target = targetShip)) ifTrue: [ ^ card effect ].
	^ 0.
]

{ #category : #initialization }
CardEffect >> initializeWith: aCard to: targetShip [

	card := aCard.
	target := targetShip.
]
