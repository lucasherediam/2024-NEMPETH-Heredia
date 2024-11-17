Class {
	#name : #CardsGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
CardsGeneratorTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #running }
CardsGeneratorTest >> test001WhenThenCardsGeneratorIsAskedToGenerateOneCardThenItGeneratesOneCard [

	| aCardsGenerator aCollectionOfCards |
	
	aCardsGenerator := CardsGenerator createWith: 1.
	
	aCollectionOfCards := aCardsGenerator cards.
	
	self assert: aCollectionOfCards size equals: 1.
]

{ #category : #running }
CardsGeneratorTest >> test002VerifyCorrectDistributionsOfCards [

	| aCardsGenerator aCollectionOfCards percent speedCards mercenaryCards accelerationCards cancellationCards redoCards repeatCards doubleCards defendCards |
	
	aCardsGenerator := CardsGenerator createWith: 5000.
	
	aCollectionOfCards := aCardsGenerator cards.
	
	self assert: aCollectionOfCards size equals: 5000.

	speedCards := aCollectionOfCards select: [ :card | card isKindOf: Speed  ].
	percent := speedCards size/aCollectionOfCards  size.
	
	self assert: ((percent) between:  0.1 and: 0.15).
	
	mercenaryCards := aCollectionOfCards select: [ :box | box isKindOf: Mercenary  ].
	percent := mercenaryCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).
	
	
	accelerationCards := aCollectionOfCards select: [ :box | box isKindOf: Acceleration  ].
	percent := accelerationCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).
	
	
	cancellationCards := aCollectionOfCards select: [ :box | box isKindOf: Cancellation  ].
	percent := cancellationCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).
	
	
	redoCards := aCollectionOfCards select: [ :box | box isKindOf: Redo  ].
	percent := redoCards size/aCollectionOfCards size.

	self assert: ((percent) between:  0.1 and: 0.15).
	
	repeatCards := aCollectionOfCards select: [ :box | box isKindOf: Repeat  ].
	percent := repeatCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).

	doubleCards := aCollectionOfCards select: [ :box | box isKindOf: Double ].
	percent := doubleCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).
	
	defendCards := aCollectionOfCards select: [ :box | box isKindOf: Defend ].
	percent := defendCards size/aCollectionOfCards size.
	
	self assert: ((percent) between:  0.1 and: 0.15).


]

{ #category : #running }
CardsGeneratorTest >> test003WhenNumberOfCardIsLessThanZeroThenThrowError [
	self
		should: [ CardsGenerator createWith: 0. ]
		raise: Error
		withMessage: 'Number of cards should be greater that zero'
	
]
