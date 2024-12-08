Class {
	#name : 'InstantCard',
	#superclass : 'Card',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'adding' }
InstantCard >> addToDiscard: deck [
	deck addToDiscardDeck: self.
]

{ #category : 'as yet unclassified' }
InstantCard >> discard: aRedo in: aGame [ 
	aGame addToDiscardDeck: aRedo.
]
