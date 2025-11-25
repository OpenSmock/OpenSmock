Class {
	#name : #SmockCompositeEffect,
	#superclass : #SmockPaintEffect,
	#instVars : [
		'effects'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #initialization }
SmockCompositeEffect >> addAll: aCollection [

	effects addAll: aCollection
]

{ #category : #initialization }
SmockCompositeEffect >> initialize [

	super initialize.
	effects := OrderedCollection new
]
