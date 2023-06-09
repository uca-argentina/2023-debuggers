Class {
	#name : #SpeedCard,
	#superclass : #Object,
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

{ #category : #'as yet unclassified' }
SpeedCard >> playableOnAnyTurn [

	^ false.
]
