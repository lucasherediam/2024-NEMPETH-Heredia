Class {
	#name : #WithoutCardsState,
	#superclass : #DeckState,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
WithoutCardsState class >> create [
	^ self new.
]

{ #category : #'as yet unclassified' }
WithoutCardsState >> giveACard: aFiniteDeck [ 
	(aFiniteDeck discardDeck) isEmpty
	ifTrue: [ ^ false ] 
	ifFalse: [ 
		aFiniteDeck changeDecks.
		aFiniteDeck changeTo: WithCardsState create.
		^ aFiniteDeck giveACard 
		 ]
]
