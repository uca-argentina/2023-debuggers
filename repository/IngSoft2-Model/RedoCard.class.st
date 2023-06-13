Class {
	#name : #RedoCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
RedoCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [
	
	(aGameEventManager cardManager) lastCardPlayed playIn: aGameEventManager from: aCardOwner to: aTargetShip.
	
]
