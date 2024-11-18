Class {
	#name : #FiniteDeck,
	#superclass : #Object,
	#instVars : [
		'cards',
		'discardDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FiniteDeck class >> createWith: cards [
	^ self new initializeWith: cards.
]

{ #category : #adding }
FiniteDeck >> addToDiscardDeck: aCard [
	discardDeck add: aCard.
]

{ #category : #accessing }
FiniteDeck >> cards [
	^ cards
]

{ #category : #'as yet unclassified' }
FiniteDeck >> discardDeck [
	^ discardDeck.
]

{ #category : #'as yet unclassified' }
FiniteDeck >> giveACard [
	^ cards removeFirst.
	
]

{ #category : #initialization }
FiniteDeck >> initializeWith: aCollectionOfCards [ 
	cards := aCollectionOfCards.
	discardDeck := OrderedCollection new.
]
