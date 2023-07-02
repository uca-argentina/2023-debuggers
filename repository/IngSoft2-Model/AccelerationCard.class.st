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
AccelerationCard >> playIn: aGameEventManager from: aPlayerCards to: aTargetPlayer [

	self checkPlayedBy: aPlayerCards matches: (PlayerCards from: aGameEventManager currentTurn).
	aGameEventManager addToAllPermanentPiles: self
]
