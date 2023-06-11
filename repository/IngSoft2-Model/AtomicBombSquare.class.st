Class {
	#name : #AtomicBombSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
AtomicBombSquare >> effectTo: aTargetShip in: aMovementManager [

	aMovementManager applyAtomicBomb.
]
