Class {
	#name : #AtomicBombSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
AtomicBombSquare >> effect: aGame [

	aGame applyAtomicBomb.
]

{ #category : #accessing }
AtomicBombSquare >> type [
	^ 'Atomic Bomb Effect'.
]
