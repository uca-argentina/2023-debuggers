Class {
	#name : #DiceCupTest,
	#superclass : #TestCase,
	#instVars : [
		'dices'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DiceCupTest >> should: anErrorBlock raise: anExceptionClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anExceptionClass
		withExceptionDo: [ :error | 
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
DiceCupTest >> test001ADiceCupCanThrowADie [
	
	| die dice aDiceCup |
	
	die := LoadedDie with: #( 7 ).
	dice := OrderedCollection with: die.
	aDiceCup := DiceCup with: dice.

	self assert: aDiceCup useDiceCup equals: 7
]

{ #category : #tests }
DiceCupTest >> test002ADiceCupCanThrowDice [
	
	| die1 die2 dice aDiceCup |
	
	die1 := LoadedDie with: #( 7 8 ).
	die2 := LoadedDie with: #( 7 6 ).
	dice := OrderedCollection with: die1 with: die2.
	aDiceCup := DiceCup with: dice.

	self assert: aDiceCup useDiceCup equals: 14
]

{ #category : #tests }
DiceCupTest >> test003ADiceCupCannotHaveZeroDice [
	
	| dice aDiceCup |
	
	dice := OrderedCollection new.

	self
		should: [ aDiceCup := DiceCup with: dice ]
		raise: Error
		withMessage: 'Unable to create dice cup without dice'
]
