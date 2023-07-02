Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
SpeedCard >> effect [

	^ 1.
]

{ #category : #'playing card' }
SpeedCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [

	self checkPlayedBy: aCardOwner matches: (PlayerCards from: aGameEventManager currentTurn).
	aGameEventManager cardManager addPermanent: self to: (PlayerCards from: aTargetShip).
]
