Class {
	#name : #SmockGShape2D,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties + TSmockHavePaintEffect + TSmockPickable',
	#classTraits : 'TSmockHaveProperties classTrait + TSmockHavePaintEffect classTrait + TSmockPickable classTrait',
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

{ #category : #testing }
SmockGShape2D >> containedInRect: aRectangle [

	^ self containedInRect: aRectangle select: [ :e | e isDrawable ]
]

{ #category : #testing }
SmockGShape2D >> containedInRect: aRectangle select: aSelectBlock [

	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ false ].

	^ self position isInsideRectangle: aRectangle
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

{ #category : #'private - comparing' }
SmockGShape2D >> distanceTo: aPoint fromPoints: aListOfPoints [
	"Compute distance between a point and a list of points which describe a polygone (distance inside the polygone is zero)"

	| maxDistance gPolygone |
	maxDistance := SmallInteger maxVal.
	aListOfPoints ifEmpty: [ ^ maxDistance ].

	gPolygone := GPolygon vertices: aListOfPoints.
	(gPolygone includes: aPoint)
		ifTrue: [ ^ 0 ]
		ifFalse: [
		^ self distanceTo: aPoint fromPointsPerimeter: aListOfPoints ]
]

{ #category : #'private - comparing' }
SmockGShape2D >> distanceTo: aPoint fromPointsPerimeter: aListOfPoints [
	"Compute distance between a point and a list of points which describe a perimeter (can compute distance inside the perimeter)"

	| distance maxDistance |
	maxDistance := SmallInteger maxVal.
	aListOfPoints ifEmpty: [ ^ maxDistance ].

	distance := maxDistance.

	"Iteration between two points (as a segment) to compute distance from it to the point"
	aListOfPoints overlappingPairsDo: [ :p1 :p2 |
			| newDist gSegment |
			gSegment := GSegment with: p1 with: p2.
			newDist := gSegment distanceTo: aPoint.
			newDist ifNotNil: [ :e | distance := e min: distance ] ].

	^ distance
]

{ #category : #'private - comparing' }
SmockGShape2D >> distanceTo: aPoint fromRectangle: aRectangle [
	"Compute distance between a point and a rectangle"

	| gRectangle distance maxDistance |
	
	maxDistance := SmallInteger maxVal.
	(aRectangle width = 0 or:[ aRectangle height = 0]) ifTrue:[ ^ maxDistance ].
	
	distance := maxDistance.
	gRectangle := GRectangle origin: aRectangle origin corner: aRectangle corner.
	(gRectangle includes: aPoint) 
		ifTrue:[ ^ 0 ] 
		ifFalse:[
			^ self distanceTo: aPoint fromPointsPerimeter: (gRectangle vertices collect:[ :e | e asPoint])
		].
]

{ #category : #comparing }
SmockGShape2D >> distanceTo: aPoint select: aSelectBlock [
	"Default general distanceTo algorithm, makes no sens on an Abstract GShape but ok for a default behavior waiting for others distanceTo implementations, need to be implement for each graphical shapes"

	self bounds
		ifNotNil: [ ^ self distanceToFromBounds: aPoint select: aSelectBlock ]
		ifNil: [ ^ self distanceToFromPosition: aPoint select: aSelectBlock ]
]

{ #category : #'private - comparing' }
SmockGShape2D >> distanceToFromBounds: aPoint select: aSelectBlock [
	"Compute distance between a point and self bounds regarding a select block"

	| maxDistance |
	maxDistance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ maxDistance ].
	self bounds ifNil: [ ^ maxDistance ].

	^ self distanceTo: aPoint fromRectangle: self bounds
]

{ #category : #'private - comparing' }
SmockGShape2D >> distanceToFromPosition: aPoint select: aSelectBlock [
	"Compute distance between a point and self bounds regarding a select block"

	| distance |
	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].
	self position ifNil: [ ^ distance ].

	^ self position distanceTo: aPoint
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
SmockGShape2D >> intersects: aRectangle [

	^ self intersects: aRectangle select: [ :e | e isDrawable ]
]

{ #category : #testing }
SmockGShape2D >> intersects: aRectangle select: aSelectBlock [

	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ false ].

	"Build a rectangle with the position to test intersection"
	^ (self position extent: 1@1) intersects: aRectangle
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
