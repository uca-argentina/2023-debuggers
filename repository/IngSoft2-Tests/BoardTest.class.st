Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
BoardTest >> test001ABoardCanTellMeItsSize [

	| aSquare squares aBoard |
	aSquare := NoEffectSquare new.
	squares := OrderedCollection with: aSquare.
	aBoard := Board with: squares.
	
	self assert: (aBoard size) = 1.
]

{ #category : #tests }
BoardTest >> test002ABoardCannotHaveZeroAmountOfSquares [

	self
		should: [ Board with: #() ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0'
]
