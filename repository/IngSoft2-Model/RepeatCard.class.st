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
RepeatCard >> playIn: aMovementManager from: aCardOwner to: aTargetShip [
	
	(aMovementManager lastSquareLanded) effectTo: aTargetShip in: aMovementManager.
]
