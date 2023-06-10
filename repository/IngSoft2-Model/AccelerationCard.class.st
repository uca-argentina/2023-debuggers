Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> effect [

	^ 1.
]

{ #category : #'as yet unclassified' }
AccelerationCard >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]

{ #category : #'as yet unclassified' }
AccelerationCard >> playIn: aGame from: aCardOwner to: aTarget [
	
	self checkPlayedBy: aCardOwner matches: aGame currentTurn.
	aGame addToAllPermanentPiles: self.
]
