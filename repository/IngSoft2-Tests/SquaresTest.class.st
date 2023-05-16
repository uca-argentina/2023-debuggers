Class {
	#name : #SquaresTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
SquaresTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
SquaresTest >> test001AMoonwalkSquareCannotHaveANegativeAmountOfSteps [

self
		should: [ MoonwalkSquare with: -5 ]
		raise: Error
		withMessage: 'Amount of steps cannot be 0 or lower'
]
