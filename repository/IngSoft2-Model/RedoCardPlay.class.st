Class {
	#name : #RedoCardPlay,
	#superclass : #Object,
	#instVars : [
		'targetShip',
		'cardToCancel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
RedoCardPlay class >> to: aTargetShip canCancel: aTargetPermanentCard [
	^ (self new) initializeTo: aTargetShip canCancel: aTargetPermanentCard.
]

{ #category : #initialization }
RedoCardPlay >> initializeTo: aTargetShip canCancel: aTargetPermanentCard [

	targetShip := aTargetShip.
	cardToCancel := aTargetPermanentCard.
]

{ #category : #'as yet unclassified' }
RedoCardPlay >> playIn: aGame [

	"Game add: card to: target."
]
