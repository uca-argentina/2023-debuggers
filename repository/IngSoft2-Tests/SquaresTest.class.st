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
SquaresTest >> test003AHyperJumpSquareCannotHaveAListOfValueThatIsNotInDescendinOrder [

	| values aValue1 aValue2 |
	
	values := OrderedCollection new.
	aValue1 := Parsec with: 1.
	aValue2 := Parsec with: 2.
	values add: aValue1.
	values add: aValue2.

self
		should: [ HyperJumpSquare with: values ]
		raise: Error
		withMessage: 'The list of values must be in descending order'
]

{ #category : #tests }
SquaresTest >> test004AHyperJumpSquareCannotHaveAListOfValueThatIsNotInDescendinOrder [

	| values aValue1 aValue2 |
	
	values := OrderedCollection new.
	aValue1 := Parsec with: 1.
	aValue2 := Parsec with: 2.
	values add: aValue1.
	values add: aValue2.

self
		should: [ HyperJumpSquare with: values ]
		raise: Error
		withMessage: 'The list of values must be in descending order'
]

{ #category : #tests }
SquaresTest >> test004AHyperJumpSquareCannotHaveAListOfValueThatIsNotInDescendinOrderAndValuesAreCompareByValueInParsecs [

	| values aValue1 aValue2 |
	
	values := OrderedCollection new.
	aValue1 := LightYear with: 1.
	aValue2 := Parsec with: 1.
	values add: aValue1.
	values add: aValue2.

self
		should: [ HyperJumpSquare with: values ]
		raise: Error
		withMessage: 'The list of values must be in descending order'
]
