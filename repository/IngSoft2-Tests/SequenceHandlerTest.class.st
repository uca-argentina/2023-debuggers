Class {
	#name : #SequenceHandlerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SequenceHandlerTest >> test001ASequenceHandlerWillRemoveAndReturnTheFirstItemAndPutItAtTheEnd [
	
	| aCollectionOfValues aSequenceHandler |
	
	aCollectionOfValues := #(1 2 3) asOrderedCollection.
	aSequenceHandler := SequenceHandler with: aCollectionOfValues.
	
	self assert: (aSequenceHandler next) equals: 1.
	
]
