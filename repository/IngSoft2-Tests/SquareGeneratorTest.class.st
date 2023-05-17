Class {
	#name : #SquareGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
SquareGeneratorTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
SquareGeneratorTest >> test001ASquareGeneratorCanGenerateANumberBetween1And100 [

	| randomSquareGenerator anAmountOfSquares |
	
	anAmountOfSquares := 100.
	randomSquareGenerator := SquareGenerator with: 100.
	
	self assert: ((randomSquareGenerator generateNumber) between: 1 and: 100). 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test002ASquareGeneratorCanGenerateSquaresBasedOnAGivenAmountOfSquares [

	| randomSquareGenerator anAmountOfSquares |
	
	anAmountOfSquares := 100.
	randomSquareGenerator := SquareGenerator with: 100.
	
	self assert: (((randomSquareGenerator generateSquares) size) = 100). 
	
	
	
]

{ #category : #tests }
SquareGeneratorTest >> test003ASquareGeneratorCannotGenerateZeroOrLowerAmountOfSquares [
	
	self
		should: [ SquareGenerator with: -5 ]
		raise: Error
		withMessage: 'Amount of squares cannot be 0 or lower'
	
	
	
]
