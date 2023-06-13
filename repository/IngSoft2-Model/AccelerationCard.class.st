Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
AccelerationCard >> effect [

	^ 1.
]

{ #category : #'playing card' }
AccelerationCard >> playIn: aGameEventManager from: aCardOwner to: aTarget [

	self checkPlayedBy: aCardOwner matches: aGameEventManager currentTurn.
	aGameEventManager cardManager addToAllPermanentPiles: self
]
