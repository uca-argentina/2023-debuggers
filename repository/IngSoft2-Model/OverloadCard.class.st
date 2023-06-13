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
OverloadCard >> playIn: aGameEventManager from: aCardOwner to: aTargetShip [

	self checkPlayedBy: aCardOwner matches: aGameEventManager currentTurn.
	aGameEventManager cardManager addPermanent: self to: aTargetShip
]
