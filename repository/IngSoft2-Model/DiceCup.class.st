Class {
	#name : #DiceCup,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
DiceCup class >> checkAmountOfDice: someDice [
	
	(someDice isEmpty) ifTrue: [ 
		Error signal: 'Unable to create dice cup without dice' ]
]

{ #category : #'instance creation' }
DiceCup class >> with: someDice [ 
	self checkAmountOfDice: someDice.
	^((self new) initializeWith: someDice). 
]

{ #category : #initialization }
DiceCup >> initializeWith: someDice [

	dice := someDice
]

{ #category : #'dice rolling' }
DiceCup >> throw [

	^ dice sumNumbers:  [ :aDie | aDie throw ].
]
