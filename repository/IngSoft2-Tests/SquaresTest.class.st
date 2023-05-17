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

{ #category : #tests }
SquaresTest >> test002AHyperJumpSquareCannotHaveEmptyValueList [

	| values |
	
	values := #() asOrderedCollection.

self
		should: [ HyperJumpSquare with: values ]
		raise: Error
		withMessage: 'The list of values cannot be empty'
]

{ #category : #tests }
SquaresTest >> test004AHyperJumpSquareCannotHaveAListOfValueThatIsNotInDescendinOrder [

	| values |
	
	values := #( 1 2 3) asOrderedCollection.

self
		should: [ HyperJumpSquare with: values ]
		raise: Error
		withMessage: 'The list of values must be in descending order'
]
