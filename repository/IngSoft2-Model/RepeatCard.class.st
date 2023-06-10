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
RepeatCard >> playIn: aGame from: aCardOwner to: aTargetShip [
	
	(aGame lastSquareLanded) effectTo: aTargetShip in: aGame.
]
