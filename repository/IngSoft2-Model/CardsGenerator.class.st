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

	| randomGenerator randomValue |
	cards := OrderedCollection new.
	randomGenerator := Random new.

	1 to: aNumberOfCards do: [ :i |
		randomValue := randomGenerator next.

		randomValue <= 0.125 ifTrue: [ cards add: (Speed createWithId: i) ].
		(randomValue > 0.125 and: [ randomValue <= 0.25 ]) ifTrue: [
			cards add: (Mercenary createWithId: i) ].
		(randomValue > 0.25 and: [ randomValue <= 0.375 ]) ifTrue: [
			cards add: (Acceleration createWithId: i) ].
		(randomValue > 0.375 and: [ randomValue <= 0.5 ]) ifTrue: [
			cards add: (Cancellation createWithId: i) ].
		(randomValue > 0.5 and: [ randomValue <= 0.625 ]) ifTrue: [
			cards add: (Redo createWithId: i) ].
		(randomValue > 0.625 and: [ randomValue <= 0.75 ]) ifTrue: [
			cards add: (Repeat createWithId: i) ].
		(randomValue > 0.75 and: [ randomValue <= 0.875 ]) ifTrue: [
			cards add: (Double createWithId: i) ].
		randomValue > 0.875 ifTrue: [ cards add: (Defend createWithId: i) ] ].

	cards shuffle.
]
