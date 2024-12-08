Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'id',
		'redoState'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Card class >> createWithId: anId [

	^ self new initializeWith: anId
]

{ #category : 'adding' }
Card >> addToDiscard: aDeck [ 
	^ nil.
]

{ #category : 'initialization' }
Card >> applyCardEffect: aCardArguments and: aGame [ 

	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
Card >> changeRedoStateTo: aRedoState [ 
	redoState := aRedoState.
]

{ #category : 'as yet unclassified' }
Card >> discardByRedoStateIn: aGame [ 
	redoState discard: self in: aGame
]

{ #category : 'accessing' }
Card >> id [

	^ id
]

{ #category : 'initialization' }
Card >> initializeWith: anId [

	id := anId.
	redoState := NotCreatedByRedo create
]
