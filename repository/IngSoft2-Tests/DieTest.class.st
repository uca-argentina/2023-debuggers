Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DieTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
DieTest >> test001ARandomDieCanThrowARandomNumber [

| aDie |
aDie:= Die with:3.

self assert: ((aDie throw) between: 1 and: 3).

]

{ #category : #tests }
DieTest >> test002ALoadedDieCanThrowAnExpectedNumber [

	| aDie sequence |
	
	sequence:= #( 2 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
]

{ #category : #tests }
DieTest >> test003ALoadedDieCanThrowAnExpectedSequenceOfNumbers [

	| aDie sequence |

	sequence:= #( 2 3 4 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.
	
]

{ #category : #tests }
DieTest >> test004ALoadedDieSequenceCanBeRepeated [

	| aDie sequence |
	sequence := #( 2 3 4 ) asOrderedCollection.
	aDie := LoadedDie with: sequence.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4.

	self assert: aDie throw equals: 2.
	self assert: aDie throw equals: 3.
	self assert: aDie throw equals: 4
]

{ #category : #tests }
DieTest >> test005ARandomDieCanCannotHaveZeroFaces [

	| aDie |
	
	self
		should: [ aDie := Die with: 0 ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test006ARandomDieCanCannotHaveNegativeAmountOfFaces [

	| aDie |
	
	self
		should: [ aDie := Die with: -3 ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test007ALoadedDieCanCannotHaveZeroFaces [

	| aDie sequence |
	
	sequence := #( 0 ).

	self
		should: [ aDie := LoadedDie with: sequence ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]

{ #category : #tests }
DieTest >> test008ALoadedDieCanCannotHaveANegativeAmountOfFaces [

	| aDie sequence |
	
	sequence := #( -5 ).

	self
		should: [ aDie := LoadedDie with: sequence ]
		raise: Error
		withMessage: 'Unable to create dice with 0 or less faces'
]
