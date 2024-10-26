"
I am a Display Image.
I am used to display an image on a geo view.
"
Class {
	#name : #SmockDImage,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'image',
		'orientation',
		'scale'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDImage >> = aDImage [

	super = aDImage ifFalse: [ ^ false ].
	self image = aDImage image ifFalse: [ ^ false ].
	self orientation = aDImage orientation ifFalse: [ ^ false ].
	self scale = aDImage scale ifFalse: [ ^ false ].

	^ true
]

{ #category : #copying }
SmockDImage >> copy [

	| copy |
	copy := super copy.
	copy image: self image copy.
	^ copy
]

{ #category : #'draw mode' }
SmockDImage >> defaultDrawMode [

	^ #device
]

{ #category : #accessing }
SmockDImage >> defaultIsTranslatedByParent [

	^ true
]

{ #category : #accessing }
SmockDImage >> image [
	^ image
]

{ #category : #accessing }
SmockDImage >> image: anObject [
	image := anObject
]

{ #category : #accessing }
SmockDImage >> orientation [

	^ orientation ifNil:[ orientation := 0 ]
]

{ #category : #accessing }
SmockDImage >> orientation: aNumber [

	orientation := aNumber
]

{ #category : #accessing }
SmockDImage >> scale [

	^ scale ifNil:[ scale := 1@1 ]
]

{ #category : #accessing }
SmockDImage >> scale: aPoint [

	scale := aPoint
]
