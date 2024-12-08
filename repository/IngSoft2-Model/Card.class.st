Class {
	#name : 'Card',
	#superclass : 'Object',
	#instVars : [
		'id',
		'createByRedo'
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
Card >> createdByRedo [
	createByRedo := true.
]

{ #category : 'accessing' }
Card >> id [

	^ id
]

{ #category : 'initialization' }
Card >> initializeWith: anId [

	id := anId.
	createByRedo := false.
]

{ #category : 'testing' }
Card >> isCreatedByRedo [
	^ createByRedo.
]
