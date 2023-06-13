Class {
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'playing card' }
RepeatCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [
	
	(aGameEventManager movementManager) lastSquareLanded effectTo: aTargetShip in: aGameEventManager.
]
