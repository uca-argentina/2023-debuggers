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
RedoCard >> playIn: aCardManager from: aCardOwner to: aTargetShip [
	
	(aCardManager lastCardPlayed) playIn: aCardManager from: aCardOwner to: aTargetShip.
	
]
