Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
RepeatCard >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]

{ #category : #'playing card' }
RepeatCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [
	
	(aGameEventManager movementManager) lastSquareLanded effectTo: aTargetShip in: aGameEventManager.
]
