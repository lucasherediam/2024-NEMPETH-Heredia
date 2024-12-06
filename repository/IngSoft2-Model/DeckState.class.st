Class {
	#name : 'DeckState',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
DeckState class >> create [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
DeckState >> giveACard: aFiniteDeck [

	self subclassResponsibility.
]
