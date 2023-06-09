Class {
	#name : #CancellationCardPlay,
	#superclass : #Object,
	#instVars : [
		'cancelTarget',
		'targetShip',
		'card'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CancellationCardPlay class >> to: aTargetPermanentCard affecting: aTargetShip [
	^ (self new) initializeTo: aTargetPermanentCard affecting: aTargetShip.
]

{ #category : #accessing }
CancellationCardPlay >> card [
	^ card
]

{ #category : #initialization }
CancellationCardPlay >> initializeTo: aTargetPermanentCard affecting: aTargetShip [
	
	card := CancellationCard new.
	cancelTarget := aTargetPermanentCard.
	targetShip := aTargetShip. 
]

{ #category : #'as yet unclassified' }
CancellationCardPlay >> playIn: aGame [
	
	aGame checkCancel: cancelTarget to: targetShip.
	aGame remove: cancelTarget to: targetShip.
]
