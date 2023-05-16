Class {
	#name : #AtomicBombSquare,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicBombSquare >> effect: aGame [

	aGame applyAtomicBomb.
]
