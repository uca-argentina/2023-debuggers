Class {
	#name : #AccelerationCard,
	#superclass : #Object,
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
AccelerationCard >> playableOnAnyTurn [

	^ false.
]
