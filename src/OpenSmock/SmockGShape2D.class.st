Class {
	#name : #SmockGShape2D,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties + TSmockHavePaintEffect',
	#classTraits : 'TSmockHaveProperties classTrait + TSmockHavePaintEffect classTrait',
	#instVars : [
		'id',
		'isVisible',
		'isTranslatedByParent',
		'position',
		'displayMask',
		'zIndex',
		'bounds',
		'graphicContext'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGShape2D class >> id: anId [

	| gShape |
	gShape := self new.
	gShape id: anId.
	^ gShape
]

{ #category : #testing }
SmockGShape2D class >> isAbstract [ 

	^ self = SmockGShape2D 
]

{ #category : #comparing }
SmockGShape2D >> = aGShape [
	"compare each values of the GShape"

	self id ~= aGShape id ifTrue: [ ^ false ].
	self position ~= aGShape position ifTrue: [ ^ false ].
	self isVisible ~= aGShape isVisible ifTrue: [ ^ false ].
	self displayMask ~= aGShape displayMask ifTrue: [ ^ false ].
	self isTranslatedByParent ~= aGShape isTranslatedByParent ifTrue:[ ^ false ].
	self zIndex ~= aGShape zIndex ifTrue:[ ^ false ].
	self effect ~= aGShape effect ifTrue:[ ^ false ].

	^ true
]

{ #category : #bounds }
SmockGShape2D >> bounds [
	"Return always a no nil bounds"

	^ bounds ifNil: [ bounds := self computeBounds ]
]

{ #category : #bounds }
SmockGShape2D >> bounds: anObject [

	bounds := anObject
]

{ #category : #bounds }
SmockGShape2D >> boundsWithEffect [
	"Return bounds with effect modification"

	^ self effect
		  ifNotNil: [ :e | e computeBounds: self bounds ]
		  ifNil: [ self bounds ]
]

{ #category : #private }
SmockGShape2D >> computeBounds [
	"Use this entry point to compute bounds depending local model"

	^ (self position ifNil: [ 0 @ 0 ]) extent: 0 @ 0
]

{ #category : #copying }
SmockGShape2D >> copy [

	| copy |
	copy := self class new.
	copy id: self id copy.
	copy isVisible: self isVisible.
	copy position: self position copy.
	copy isTranslatedByParent: self isTranslatedByParent.
	copy displayMask: self displayMask copy.
	copy zIndex: self zIndex.
	copy effect: self effect copy.

	^ copy
]

{ #category : #accessing }
SmockGShape2D >> displayMask [

	^ displayMask
]

{ #category : #accessing }
SmockGShape2D >> displayMask: anObject [

	displayMask := anObject
]

{ #category : #comparing }
SmockGShape2D >> distanceTo: aPoint [
	"By default considere that a no drawable element is not distancable"

	^ self distanceTo: aPoint select: [ :e | e isDrawable ]
]

{ #category : #comparing }
SmockGShape2D >> distanceTo: aPoint select: aSelectBlock [
	"Default general distanceTo algorithm, makes no sens on an Abstract GShape but ok for a default behavior waiting for others distanceTo implementations, need to be implement for each graphical shapes"

	| distance |
	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].

	^ self position
		  ifNil: [ distance ]
		  ifNotNil: [ :pos | pos distanceTo: aPoint ]
]

{ #category : #accessing }
SmockGShape2D >> graphicContext [

	^ graphicContext
]

{ #category : #accessing }
SmockGShape2D >> graphicContext: anObject [

	graphicContext := anObject
]

{ #category : #accessing }
SmockGShape2D >> id [

	^ id
]

{ #category : #accessing }
SmockGShape2D >> id: anObject [

	id := anObject
]

{ #category : #testing }
SmockGShape2D >> isComposite [

	^ false
]

{ #category : #testing }
SmockGShape2D >> isDrawable [

	^ self isVisible
]

{ #category : #testing }
SmockGShape2D >> isLeaf [

	^ false
]

{ #category : #accessing }
SmockGShape2D >> isTranslatedByParent [

	^ isTranslatedByParent ifNil:[ isTranslatedByParent := true ]
]

{ #category : #accessing }
SmockGShape2D >> isTranslatedByParent: anObject [

	isTranslatedByParent := anObject
]

{ #category : #accessing }
SmockGShape2D >> isVisible [

	^ isVisible ifNil:[ isVisible := true ].
]

{ #category : #accessing }
SmockGShape2D >> isVisible: anObject [

	isVisible := anObject
]

{ #category : #private }
SmockGShape2D >> notifyGraphicContextThanPropertyHasChanged: aSymbol [

	self graphicContext ifNotNil: [
		self graphicContext propertyHasChanged: aSymbol ]
]

{ #category : #accessing }
SmockGShape2D >> position [

	^ position
]

{ #category : #accessing }
SmockGShape2D >> position: anObject [

	position ~= anObject ifFalse: [ ^ self ].
	position := anObject.
	self notifyGraphicContextThanPropertyHasChanged: #position
]

{ #category : #printing }
SmockGShape2D >> printOn: aStream [

	super printOn: aStream.
	self id ifNotNil: [ :e |
		aStream space.
		aStream nextPutAll: e printString ].

	self isVisible ifTrue: [ ^ self ].
	aStream space.
	aStream nextPutAll: '(not visible)'
]

{ #category : #accessing }
SmockGShape2D >> zIndex [

	^ zIndex ifNil:[ zIndex := 0 ]
]

{ #category : #accessing }
SmockGShape2D >> zIndex: anInteger [

	zIndex := anInteger
]
