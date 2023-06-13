Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
Card >> equals: anotherCard [

	^ anotherCard isKindOf: self class.
]
