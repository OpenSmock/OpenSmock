"
I am a Display Line.
I am used to display a line on a geo view.
"
Class {
	#name : #SmockDLine,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'orientation'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDLine >> = aDLine [

	super = aDLine ifFalse: [ ^ false ].
	self orientation = aDLine orientation ifFalse: [ ^ false ].

	^ true
]

{ #category : #copying }
SmockDLine >> copy [

	| copy |
	copy := super copy.
	copy orientation: self orientation.
	^ copy
]

{ #category : #accessing }
SmockDLine >> orientation [
	^ orientation
]

{ #category : #accessing }
SmockDLine >> orientation: anObject [
	orientation := anObject
]
