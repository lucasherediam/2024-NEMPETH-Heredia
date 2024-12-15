Class {
	#name : 'RedoState',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
RedoState class >> create [
	^ self new.
]

{ #category : 'as yet unclassified' }
RedoState >> discard: aCard in: aGame [
	self subclassResponsibility
]
