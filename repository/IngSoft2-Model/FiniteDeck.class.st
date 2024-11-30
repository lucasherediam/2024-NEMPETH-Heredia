Class {
	#name : #FiniteDeck,
	#superclass : #Object,
	#instVars : [
		'cards',
		'discardDeck',
		'state'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FiniteDeck class >> createWith: cards [

	self emptyDeckValidation: cards.
	^ self new initializeWith: cards
]

{ #category : #'instance creation' }
FiniteDeck class >> emptyDeckValidation: cards [

	cards isEmpty ifTrue: [
		Error signal: 'The deck should be created with at least one card' ]
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
FiniteDeck >> changeDecks [
	cards := discardDeck shuffle.
	discardDeck := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
FiniteDeck >> changeTo: anState [ 
	state := anState.
]

{ #category : #'as yet unclassified' }
FiniteDeck >> discardDeck [
	^ discardDeck.
]

{ #category : #'as yet unclassified' }
FiniteDeck >> giveACard [
	
	^ state giveACard: self.
	
]

{ #category : #initialization }
FiniteDeck >> initializeWith: aCollectionOfCards [ 
	cards := aCollectionOfCards.
	discardDeck := OrderedCollection new.
	state := WithCardsState create.
]
