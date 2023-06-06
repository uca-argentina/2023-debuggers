Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
OverloadCard >> applyAll [

	^ false.
]

{ #category : #'as yet unclassified' }
OverloadCard >> effect [

	^ -2.
]

{ #category : #'as yet unclassified' }
OverloadCard >> playableOnAnyTurn [

	^ false.
]

{ #category : #'as yet unclassified' }
OverloadCard >> use: aGame to: targetShip [.

	aGame addToPermanentPile: (CardEffect with: self to: targetShip).
]
