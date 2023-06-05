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

	| aSquare squares aBoard anAmountOfParsecs |
	aSquare := NoEffectSquare new.
	squares := OrderedCollection with: aSquare.
	anAmountOfParsecs := 1.
	aBoard := Board with: squares and: anAmountOfParsecs.
	
	self assert: (aBoard size) equals: 1.
]

{ #category : #tests }
BoardTest >> test002ABoardCannotHaveZeroAmountOfSquares [
	
	| anAmountOfParsecs |
	
	anAmountOfParsecs := 1.
	
	self
		should: [ Board with: #()  and: anAmountOfParsecs ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0'
]

{ #category : #tests }
BoardTest >> test003ABoardCannotHaveZeroAmountOfParsecsOrLower [
	
	| anInvalidAmountOfParsecs aSquare squares |
	
	aSquare := NoEffectSquare new.
	squares := OrderedCollection with: aSquare.
	anInvalidAmountOfParsecs := -1.
	
	self
		should: [ Board with: squares and: anInvalidAmountOfParsecs ]
		raise: Error
		withMessage: 'Amount of parsecs cannot be 0 or lower'
]

{ #category : #tests }
BoardTest >> test004ABoardsAmountOfParsecsMustBeDivisibleByTheAmountOfSquares [
	
	| anInvalidAmountOfParsecs aSquare1 aSquare2 squares |
	
	aSquare1 := NoEffectSquare new.
	aSquare2 := NoEffectSquare new.
	squares := OrderedCollection with: aSquare1. 
	squares add: aSquare2.
	anInvalidAmountOfParsecs := 1.
	
	self
		should: [ Board with: squares and: anInvalidAmountOfParsecs ]
		raise: Error
		withMessage: 'Amount of parsecs must be divisible by the amount of squares'
]
