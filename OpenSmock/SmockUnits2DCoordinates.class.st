Class {
	#name : #SmockUnits2DCoordinates,
	#superclass : #SmockAbstractCoordinates,
	#instVars : [
		'xUnitValue',
		'yUnitValue'
	],
	#category : #'OpenSmock-Coordinates'
}

{ #category : #'instance creation' }
SmockUnits2DCoordinates class >> random [

	| random |
	random := Random new.
	^ self x: ((random next * 100) rounded units: #point) y: ((random next * 100) rounded units: #point)
]

{ #category : #'instance creation' }
SmockUnits2DCoordinates class >> x: aXUnitValue y: aYUnitValue [

	^ self xUnitValue: aXUnitValue yUnitValue: aYUnitValue
]

{ #category : #'instance creation' }
SmockUnits2DCoordinates class >> xUnitValue: aXUnitValue yUnitValue: aYUnitValue [

	| coordinates |
	coordinates := self new
		               xUnitValue: aXUnitValue;
		               yUnitValue: aYUnitValue;
		               yourself.
	^ coordinates
]

{ #category : #'instance creation' }
SmockUnits2DCoordinates class >> zero [
	"zero return pixel coordinates as a default unit"

	^ self xUnitValue: 0 pixel yUnitValue: 0 pixel
]

{ #category : #testing }
SmockUnits2DCoordinates >> = aCoordinates [

	aCoordinates ifNil: [ ^ false ].
	aCoordinates class = self class ifFalse:[ ^ false ].

	^ self xUnitValue = aCoordinates xUnitValue and: [
		  self yUnitValue = aCoordinates yUnitValue ]
]

{ #category : #testing }
SmockUnits2DCoordinates >> asPoint [

	self isValid ifFalse: [ ^ nil ].
	^ self x @ self y 
]

{ #category : #copying }
SmockUnits2DCoordinates >> copy [

	| copy |
	copy := super copy.
	copy xUnitValue: self xUnitValue.		
	copy yUnitValue: self yUnitValue.	
	^copy
]

{ #category : #testing }
SmockUnits2DCoordinates >> is2D [

	^ true
]

{ #category : #testing }
SmockUnits2DCoordinates >> is3D [

	^ false
]

{ #category : #testing }
SmockUnits2DCoordinates >> isEmpty [

	^ self x isNil and: [ self y isNil ]
]

{ #category : #testing }
SmockUnits2DCoordinates >> isValid [

	^ self x notNil and: [ self y notNil ]
]

{ #category : #accessing }
SmockUnits2DCoordinates >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' x: ', (self xUnitValue ifNil:['--'] ifNotNil:[ :e | e printString ]);
		nextPutAll: ' y: ', (self yUnitValue ifNil:['--'] ifNotNil:[ :e | e printString ]).
]

{ #category : #accessing }
SmockUnits2DCoordinates >> x [

	^ self xUnitValue ifNotNil: [ :e | e value ] ifNil: [  ]
]

{ #category : #accessing }
SmockUnits2DCoordinates >> xUnitValue [

	^ xUnitValue
]

{ #category : #accessing }
SmockUnits2DCoordinates >> xUnitValue: anObject [

	xUnitValue := anObject
]

{ #category : #accessing }
SmockUnits2DCoordinates >> y [

	^ self yUnitValue ifNotNil: [ :e | e value ] ifNil: [  ]
]

{ #category : #accessing }
SmockUnits2DCoordinates >> yUnitValue [

	^ yUnitValue
]

{ #category : #accessing }
SmockUnits2DCoordinates >> yUnitValue: anObject [

	yUnitValue := anObject
]
