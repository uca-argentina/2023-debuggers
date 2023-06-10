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
OverloadCard >> playIn: aGame from: aCardOwner to: aTargetShip [
	
	self checkPlayedBy: aCardOwner matches: aGame currentTurn.
	aGame add: self to: aTargetShip.
]
