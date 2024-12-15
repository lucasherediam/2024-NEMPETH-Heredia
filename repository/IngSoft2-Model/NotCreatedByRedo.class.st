Class {
	#name : 'NotCreatedByRedo',
	#superclass : 'RedoState',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NotCreatedByRedo >> discard: aCard in: aGame [ 
	aGame addToDiscardDeck: aCard
]
