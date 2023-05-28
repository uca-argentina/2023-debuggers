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
	self assert: ((aSequenceHandler sequence) at: 1) equals: 2.
	self assert: ((aSequenceHandler sequence) at: 2) equals: 3.
	self assert: ((aSequenceHandler sequence) at: 3) equals: 1.
]
