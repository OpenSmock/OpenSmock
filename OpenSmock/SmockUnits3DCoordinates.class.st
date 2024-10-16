Class {
	#name : #SmockUnits3DCoordinates,
	#superclass : #SmockUnits2DCoordinates,
	#instVars : [
		'zUnitValue'
	],
	#category : #'OpenSmock-Coordinates'
}

{ #category : #'instance creation' }
SmockUnits3DCoordinates class >> random [

	| random |
	random := Random new.
	^ self x: ((random next * 100) rounded units: #point) y: ((random next * 100) rounded units: #point) z: ((random next * 100) rounded units: #point)
]

{ #category : #'instance creation' }
SmockUnits3DCoordinates class >> x: aXUnitValue y: aYUnitValue z: aZUnitValue [

	^ self
		  xUnitValue: aXUnitValue
		  yUnitValue: aYUnitValue
		  zUnitValue: aZUnitValue
]

{ #category : #'instance creation' }
SmockUnits3DCoordinates class >> xUnitValue: aXUnitValue yUnitValue: aYUnitValue zUnitValue: aZUnitValue [

	| coordinates |
	coordinates := self xUnitValue: aXUnitValue yUnitValue: aYUnitValue.
	coordinates zUnitValue: aZUnitValue.
	^ coordinates
]

{ #category : #'instance creation' }
SmockUnits3DCoordinates class >> zero [
	"zero return pixel coordinates as a default unit"

	^ self xUnitValue: 0 pixel yUnitValue: 0 pixel zUnitValue: 0 pixel
]

{ #category : #testing }
SmockUnits3DCoordinates >> = aCoordinates [

	super = aCoordinates ifFalse: [ ^ false ].

	^ self zUnitValue = aCoordinates zUnitValue
]

{ #category : #copying }
SmockUnits3DCoordinates >> copy [

	| copy |
	copy := super copy.
	copy zUnitValue: self zUnitValue.
	^copy
]

{ #category : #testing }
SmockUnits3DCoordinates >> is2D [

	^ false
]

{ #category : #testing }
SmockUnits3DCoordinates >> is3D [

	^ true
]

{ #category : #testing }
SmockUnits3DCoordinates >> isEmpty [

	^ super isEmpty and:[ self z isNil ]
]

{ #category : #testing }
SmockUnits3DCoordinates >> isValid [

	super isValid ifFalse: [ ^ false ].
	^ self z notNil
]

{ #category : #accessing }
SmockUnits3DCoordinates >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' z: ', (self zUnitValue ifNil:['--'] ifNotNil:[ :e | e printString ]).
]

{ #category : #accessing }
SmockUnits3DCoordinates >> z [

	^ self zUnitValue ifNotNil: [ :e | e value ] ifNil: [  ]
]

{ #category : #accessing }
SmockUnits3DCoordinates >> zUnitValue [

	^ zUnitValue
]

{ #category : #accessing }
SmockUnits3DCoordinates >> zUnitValue: anObject [

	zUnitValue := anObject
]
