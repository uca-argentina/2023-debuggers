Class {
	#name : #PlayedPermanent,
	#superclass : #Object,
	#instVars : [
		'card',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PlayedPermanent class >> with: aPermanentCard to: aTargetShip [

	^ (self new) initializeWith: aPermanentCard to: aTargetShip.
]

{ #category : #accessing }
PlayedPermanent >> card [
	^ card
]

{ #category : #initialization }
PlayedPermanent >> initializeWith: aPermanentCard to: aTargetShip [

	card := aPermanentCard.
	target := aTargetShip.
]

{ #category : #accessing }
PlayedPermanent >> target [
	^ target
]
