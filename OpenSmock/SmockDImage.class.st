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

{ #category : #copying }
SmockDImage >> copy [
	| copy |
	copy := super copy.
	copy image: self image copy.
	^copy
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
