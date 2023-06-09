Class {
	#name : #OverloadCard,
	#superclass : #Object,
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

{ #category : #'as yet unclassified' }
OverloadCard >> playableOnAnyTurn [

	^ false.
]
