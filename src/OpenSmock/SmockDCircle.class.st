"
I am a Display Circle.
I am used to display a Circle on a geo view.
"
Class {
	#name : #SmockDCircle,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'radius'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDCircle >> = aDCircle [

	super = aDCircle ifFalse: [ ^ false ].
	self radius = aDCircle radius ifFalse: [ ^ false ].

	^ true
]

{ #category : #copying }
SmockDCircle >> copy [

	| copy |
	copy := super copy.
	copy radius: self radius.
	^ copy
]

{ #category : #accessing }
SmockDCircle >> radius [
	^ radius
]

{ #category : #accessing }
SmockDCircle >> radius: anObject [
	radius := anObject
]
