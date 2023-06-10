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
RedoCard >> playIn: aGame from: aCardOwner to: aTargetShip [
	
	(aGame lastCardPlayed) playIn: aGame from: aCardOwner to: aTargetShip.
	
]
