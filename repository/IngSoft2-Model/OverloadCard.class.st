Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
OverloadCard >> effect [

	^ -2.
]

{ #category : #'as yet unclassified' }
OverloadCard >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]

{ #category : #'playing card' }
OverloadCard >> playIn: aCardManager from: aCardOwner to: aTargetShip [
	
	self checkPlayedBy: aCardOwner matches: aCardManager currentTurn.
	aCardManager addPermanent: self to: aTargetShip.
]
