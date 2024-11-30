Class {
	#name : #WithCardsState,
	#superclass : #DeckState,
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
WithCardsState class >> create [
	^ self new
]

{ #category : #'as yet unclassified' }
WithCardsState >> giveACard: aFiniteDeck [

	aFiniteDeck cards isEmpty ifTrue: [
		aFiniteDeck changeTo: WithoutCardsState create.
		^ aFiniteDeck giveACard ].
	^ aFiniteDeck cards removeFirst
]
