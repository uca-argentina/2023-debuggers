Class {
	#name : #AtomicBombSquare,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
AtomicBombSquare >> effect: aGame [

	aGame applyAtomicBomb.
]
