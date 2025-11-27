"
I'm an effect that display a background behind an object.
For example to render a text as a label.
"
Class {
	#name : #SmockDuplicateEffect,
	#superclass : #SmockPaintEffect,
	#traits : 'TSmockHavePaintStyles',
	#classTraits : 'TSmockHavePaintStyles classTrait',
	#instVars : [
		'order'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #order }
SmockDuplicateEffect >> beAbove [

	order := #above
]

{ #category : #order }
SmockDuplicateEffect >> beBelow [

	order := #below
]

{ #category : #testing }
SmockDuplicateEffect >> canBeAppliedTo: anObject [
	"return true of false if the effect can be applied to this object"

	^ anObject isLeaf
]

{ #category : #order }
SmockDuplicateEffect >> isAbove [

	^ self order = #above
]

{ #category : #order }
SmockDuplicateEffect >> isBelow [

	^ self order = #below
]

{ #category : #accessing }
SmockDuplicateEffect >> order [

	order ifNil: [ self beBelow ].
	^ order
]

{ #category : #accessing }
SmockDuplicateEffect >> order: anObject [

	order := anObject
]
