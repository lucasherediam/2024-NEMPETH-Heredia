Class {
	#name : #CardsGenerator,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CardsGenerator class >> createWith: aNumberOfCards [

	self numberOfCardsValidation: aNumberOfCards.

	^ self new initializeWith: aNumberOfCards
]

{ #category : #'instance creation' }
CardsGenerator class >> numberOfCardsValidation: aNumberOfCards [

	aNumberOfCards <= 0 ifTrue: [
		Error signal: 'Number of cards should be greater that zero' ]
]

{ #category : #initialization }
CardsGenerator >> cards [ 
	^ cards.
]

{ #category : #initialization }
CardsGenerator >> initializeWith: aNumberOfCards [

	| randomGenerator randomValue cardMapping |
	cards := OrderedCollection new.
	randomGenerator := Random new.

	1 to: aNumberOfCards do: [ :i |
		cardMapping := {
			               (1 -> Speed).
			               (2 -> Mercenary).
			               (3 -> Acceleration).
			               (4 -> Cancellation).
			               (5 -> Redo).
			               (6 -> Repeat).
			               (7 -> Defend).
			               (8 -> Double) } asDictionary.
		randomValue := #( 1 2 3 4 5 6 7 8 ) atRandom.
		cards add: ((cardMapping at: randomValue) createWithId: i) ]
]
