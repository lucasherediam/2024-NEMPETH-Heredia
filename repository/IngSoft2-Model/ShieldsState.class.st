Class {
	#name : 'ShieldsState',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
ShieldsState class >> create [
	self subclassResponsibility.
]

{ #category : 'as yet unclassified' }
ShieldsState >> applyDefendTo: aSpaceship [ 
	self subclassResponsibility.
]
