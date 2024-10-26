"
I am a root DisplayShape.
I am used to convert a geographical coordinate data to a user coordinates graphic data.
"
Class {
	#name : #SmockDShape,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties',
	#classTraits : 'TSmockHaveProperties classTrait',
	#instVars : [
		'key',
		'coordinates',
		'isVisible',
		'isTranslatedByParent',
		'displayMask',
		'displayOffset',
		'zIndex',
		'coordinatesDeviceOffset',
		'drawMode'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #accessing }
SmockDShape class >> key: aKey [

	| dShape |
	dShape := self new.
	dShape key: aKey.
	^ dShape
]

{ #category : #comparing }
SmockDShape >> = aDShape [
	"compare each values of the DShape"

	self key ~= aDShape key ifTrue: [ ^ false ].
	self coordinates ~= aDShape coordinates ifTrue: [ ^ false ].
	self isVisible ~= aDShape isVisible ifTrue: [ ^ false ].
	self displayMask ~= aDShape displayMask ifTrue: [ ^ false ].
	self isTranslatedByParent ~= aDShape isTranslatedByParent ifTrue:[ ^ false ].
	self isSelected ~= aDShape isSelected ifTrue:[ ^ false ].
	self zIndex ~= aDShape zIndex ifTrue:[ ^ false ].
	self coordinatesDeviceOffset ~= aDShape coordinatesDeviceOffset ifTrue:[ ^ false ].

	^ true
]

{ #category : #accessing }
SmockDShape >> coordinates [
	^ coordinates
]

{ #category : #accessing }
SmockDShape >> coordinates: anObject [
	coordinates := anObject
]

{ #category : #accessing }
SmockDShape >> coordinatesDeviceOffset [

	^ coordinatesDeviceOffset
]

{ #category : #accessing }
SmockDShape >> coordinatesDeviceOffset: anObject [

	coordinatesDeviceOffset := anObject
]

{ #category : #copying }
SmockDShape >> copy [

	| copy |
	copy := self class new.
	copy key: self key copy.
	copy coordinates: self coordinates copy.
	copy isVisible: self isVisible.
	copy displayMask: self displayMask copy.
	copy isTranslatedByParent: self isTranslatedByParent.
	copy coordinatesDeviceOffset: self coordinatesDeviceOffset.
	
	copy zIndex: self zIndex.
	^ copy
]

{ #category : #'draw mode' }
SmockDShape >> defaultDrawMode [

	^ #user
]

{ #category : #accessing }
SmockDShape >> defaultIsTranslatedByParent [
	"Depending the shape, the parent can be translate the shape to reduice coordinates processing"
	"Typically this is usefull for shape that have a center that it should be the coordinates of the composite"

	^ false
]

{ #category : #accessing }
SmockDShape >> displayMask [
	^ displayMask
]

{ #category : #accessing }
SmockDShape >> displayMask: anObject [
	displayMask := anObject
]

{ #category : #accessing }
SmockDShape >> displayOffset [

	self deprecated:'use coordinatesDeviceOffset'.
	^ displayOffset
]

{ #category : #accessing }
SmockDShape >> displayOffset: anObject [

	self deprecated:'use coordinatesDeviceOffset'.
	displayOffset := anObject
]

{ #category : #'draw mode' }
SmockDShape >> drawMode [

	^ drawMode ifNil: [ drawMode := self defaultDrawMode ]
]

{ #category : #'draw mode' }
SmockDShape >> drawMode: aSymbol [

	drawMode := aSymbol
]

{ #category : #testing }
SmockDShape >> hasUserComputing [

	^ self isDrawModeUser or: [ self isTranslatedByParent not ]
]

{ #category : #initialization }
SmockDShape >> initialize [

	super initialize
]

{ #category : #testing }
SmockDShape >> isComposite [

	^ false
]

{ #category : #'draw mode' }
SmockDShape >> isDrawModeDevice [

	^ self drawMode = #device
]

{ #category : #'draw mode' }
SmockDShape >> isDrawModeUser [

	^ self drawMode = #user
]

{ #category : #testing }
SmockDShape >> isLeaf [

	^ false
]

{ #category : #testing }
SmockDShape >> isSelected [

	^ (self getProperty: #selected) = true
]

{ #category : #testing }
SmockDShape >> isSelected: aBoolean [

	self setProperty: #selected value: aBoolean 
]

{ #category : #accessing }
SmockDShape >> isTranslatedByParent [

	^ isTranslatedByParent ifNil: [
		  isTranslatedByParent := self defaultIsTranslatedByParent ]
]

{ #category : #accessing }
SmockDShape >> isTranslatedByParent: anObject [

	isTranslatedByParent := anObject
]

{ #category : #accessing }
SmockDShape >> isVisible [
	isVisible ifNil:[isVisible := true].
	^ isVisible
]

{ #category : #accessing }
SmockDShape >> isVisible: anObject [
	isVisible := anObject
]

{ #category : #accessing }
SmockDShape >> key [
	^ key
]

{ #category : #accessing }
SmockDShape >> key: anObject [
	key := anObject
]

{ #category : #printing }
SmockDShape >> printOn: aStream [

	super printOn: aStream.
	self key ifNotNil: [ :e |
		aStream space.
		aStream nextPutAll: e printString ].

	self isVisible ifTrue: [ ^ self ].
	aStream space.
	aStream nextPutAll: '(not visible)'
]

{ #category : #'draw mode' }
SmockDShape >> setDrawModeDevice [

	self drawMode: #device
]

{ #category : #'draw mode' }
SmockDShape >> setDrawModeUser [

	self drawMode: #user
]

{ #category : #accessing }
SmockDShape >> zIndex [

	^ zIndex ifNil:[ zIndex := 0 ]
]

{ #category : #accessing }
SmockDShape >> zIndex: anInteger [

	zIndex := anInteger
]
