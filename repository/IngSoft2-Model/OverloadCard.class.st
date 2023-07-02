Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
OverloadCard >> effect [

	^ -2.
]

{ #category : #'playing card' }
OverloadCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [

	self checkPlayedBy: aCardOwner matches: (PlayerCards from: aGameEventManager currentTurn).
	aGameEventManager cardManager addPermanent: self to: (PlayerCards from: aTargetShip).
]
