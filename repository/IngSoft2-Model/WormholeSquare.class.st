Class {
	#name : #WormholeSquare,
	#superclass : #Square,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
WormholeSquare >> effect: aGame [
	aGame applyWormhole.
]
