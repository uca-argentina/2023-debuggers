Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> test001AGameCanStart [

	| aGame |
	aGame := Game new.
	self assert: aGame start.
]

{ #category : #tests }
GameTest >> test002AGameCanStartWithASingleShipAndABoard [
	
	| aShip aBoard aGame |
	aShip := Ship initializeWithPosition: 3.
	aBoard := 10.
	aGame := Game with: aShip and: aBoard.
	self assert: Game start.
]
