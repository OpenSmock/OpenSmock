Class {
	#name : #Smock2DCoordinates,
	#superclass : #SmockAbstractCoordinates,
	#instVars : [
		'x',
		'y'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
Smock2DCoordinates class >> x: aXValue y: aYValue [

	| coordinates |
	coordinates := self new x: aXValue; y: aYValue; yourself.
	^ coordinates
]

{ #category : #'instance creation' }
Smock2DCoordinates class >> zero [ 

	^ self x: 0 y: 0 
]

{ #category : #testing }
Smock2DCoordinates >> asPoint [

	self isValid ifFalse:[ ^ nil ].
	^ self x @ self y
]

{ #category : #testing }
Smock2DCoordinates >> isEmpty [

	self x ifNil: [ ^ true ].
	self y ifNil: [ ^ true ].
	^ false
]

{ #category : #testing }
Smock2DCoordinates >> isValid [

	^ self isNotEmpty and: [ self x isNumber and: [ self y isNumber ] ]
]

{ #category : #accessing }
Smock2DCoordinates >> x [

	^ x
]

{ #category : #accessing }
Smock2DCoordinates >> x: anObject [

	x := anObject
]

{ #category : #accessing }
Smock2DCoordinates >> y [

	^ y
]

{ #category : #accessing }
Smock2DCoordinates >> y: anObject [

	y := anObject
]
