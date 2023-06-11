Class {
	#name : #WormholeSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
WormholeSquare >> effectTo: aTargetShip in: aMovementManager [

	aMovementManager updatePosition: -4 to: aTargetShip.
]
