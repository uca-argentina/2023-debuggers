Class {
	#name : #RedoCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
RedoCard >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]

{ #category : #'playing card' }
RedoCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [
	
	(aGameEventManager cardManager) lastCardPlayed playIn: aGameEventManager from: aCardOwner to: aTargetShip.
	
]
