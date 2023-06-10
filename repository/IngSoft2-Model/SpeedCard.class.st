Class {
	#name : #SpeedCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpeedCard >> effect [

	^ 1.
]

{ #category : #'as yet unclassified' }
SpeedCard >> equals: anotherCard [

	^ anotherCard isKindOf: SpeedCard.
]

{ #category : #'playing card' }
SpeedCard >> playIn: aCardManager from: aCardOwner to: aTargetShip [
	
	self checkPlayedBy: aCardOwner matches: aCardManager currentTurn.
	aCardManager addPermanent: self to: aTargetShip.
	
]
