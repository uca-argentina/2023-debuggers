Class {
	#name : #SpeedCardPlay,
	#superclass : #Object,
	#instVars : [
		'card',
		'target'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #instanceCreation }
SpeedCardPlay class >> with: aTargetShip [ 
	^ (self new) initializeWith: aTargetShip.
]

{ #category : #accessing }
SpeedCardPlay >> card [
	^ card
]

{ #category : #initialization }
SpeedCardPlay >> initializeWith: aTargetShip [

	card := SpeedCard new.
	target := aTargetShip.
]

{ #category : #'as yet unclassified' }
SpeedCardPlay >> playIn: aGame [

	aGame add: card to: target.
]

{ #category : #'as yet unclassified' }
SpeedCardPlay >> playIn: aGame from: aCardOwner [
	
	"self checkPlayed: aGame currentTurn from: aCardOwner."
	aGame add: card to: target.
]
