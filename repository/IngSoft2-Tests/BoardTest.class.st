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
	anAmountOfParsecs := Parsec with: 1.
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
	anInvalidAmountOfParsecs := Parsec with: -1.
	
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
	anInvalidAmountOfParsecs := Parsec with: 1.
	
	self
		should: [ Board with: squares and: anInvalidAmountOfParsecs ]
		raise: Error
		withMessage: 'Amount of parsecs must be divisible by the amount of squares'
]

{ #category : #tests }
BoardTest >> test005ABoardCanTellMeTheAmountOfParsecs [
	
	| anAmountOfParsecs aSquare1 aSquare2 squares aBoard |
	
	aSquare1 := NoEffectSquare new.
	aSquare2 := NoEffectSquare new.
	squares := OrderedCollection with: aSquare1. 
	squares add: aSquare2.
	anAmountOfParsecs := Parsec with: 4.
	aBoard := Board with: squares and: anAmountOfParsecs.
	
	self assert: aBoard parsecs equals: 4.
	

]

{ #category : #tests }
BoardTest >> test006ABoardCanTellMeTheAmountOfParsecsEvenIfItWasCreatedWithLightYears [
	
	| anAmountOfLightYears aSquare1 aSquare2 squares aBoard |
	
	aSquare1 := NoEffectSquare new.
	aSquare2 := NoEffectSquare new.
	squares := OrderedCollection with: aSquare1. 
	squares add: aSquare2.
	anAmountOfLightYears := LightYear with: 12.
	aBoard := Board with: squares and: anAmountOfLightYears.
	
	self assert: aBoard parsecs equals: 4.
	

]
