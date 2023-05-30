Class {
	#name : #WormholeSquare,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
WormholeSquare >> effect: aGame [
	aGame updatePosition: -4.
]

{ #category : #accessing }
WormholeSquare >> type [
	^ 'Wormhole Effect'.
]
