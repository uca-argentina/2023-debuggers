Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> applyAll [

	^ true.
]

{ #category : #'as yet unclassified' }
AccelerationCard >> effect [

	^ 1.
]

{ #category : #'as yet unclassified' }
AccelerationCard >> playableOnAnyTurn [

	^ false.
]

{ #category : #'as yet unclassified' }
AccelerationCard >> use: aGame to: targetShip [

	aGame addToPermanentPile: (CardEffect with: self to: targetShip).
]
