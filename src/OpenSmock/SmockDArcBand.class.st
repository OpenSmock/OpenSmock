"
I am a Display Donut.
I am used to display a donut on a geo view.
"
Class {
	#name : #SmockDArcBand,
	#superclass : #SmockDLeafShape,
	#instVars : [
		'radiusMin',
		'radiusMax',
		'orientation',
		'aperture',
		'isClosed'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDArcBand >> = aDArcBand [

	super = aDArcBand ifFalse: [ ^ false ].
	self aperture = aDArcBand aperture ifFalse: [ ^ false ].
	self isClosed = aDArcBand isClosed ifFalse: [ ^ false ].
	self orientation = aDArcBand orientation ifFalse: [ ^ false ].
	self radiusMin = aDArcBand radiusMin ifFalse: [ ^ false ].
	self radiusMax = aDArcBand radiusMax ifFalse: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockDArcBand >> aperture [
	^ aperture
]

{ #category : #accessing }
SmockDArcBand >> aperture: anObject [
	aperture := anObject
]

{ #category : #copying }
SmockDArcBand >> copy [
	| copy |
	copy := super copy.
	copy radiusMin: self radiusMin.
	copy radiusMax: self radiusMax.
	copy aperture: self aperture.
	copy orientation: self orientation.
	copy isClosed: self isClosed.
	^copy
]

{ #category : #accessing }
SmockDArcBand >> isClosed [

	^ isClosed ifNil: [ isClosed := false ]
]

{ #category : #accessing }
SmockDArcBand >> isClosed: aBoolean [

	isClosed := aBoolean
]

{ #category : #accessing }
SmockDArcBand >> orientation [
	^ orientation
]

{ #category : #accessing }
SmockDArcBand >> orientation: anObject [
	orientation := anObject
]

{ #category : #accessing }
SmockDArcBand >> radiusMax [
	^ radiusMax
]

{ #category : #accessing }
SmockDArcBand >> radiusMax: anObject [
	radiusMax := anObject
]

{ #category : #accessing }
SmockDArcBand >> radiusMin [
	^ radiusMin
]

{ #category : #accessing }
SmockDArcBand >> radiusMin: anObject [
	radiusMin := anObject
]
