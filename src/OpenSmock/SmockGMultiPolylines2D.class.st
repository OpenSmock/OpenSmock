Class {
	#name : #SmockGMultiPolylines2D,
	#superclass : #SmockGMultiShapes2D,
	#category : #'OpenSmock-GShape'
}

{ #category : #polylines }
SmockGMultiPolylines2D >> addPolyline: aGPolyline2D [

	self addShape: aGPolyline2D
]

{ #category : #polylines }
SmockGMultiPolylines2D >> addPolylines: aGPolyline2DList [

	self addShapes: aGPolyline2DList
]

{ #category : #comparing }
SmockGMultiPolylines2D >> distanceTo: aPoint select: aSelectBlock [

	| distance |
	
	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].
	
	distance := super distanceTo: aPoint select: aSelectBlock.
	self polylines isEmptyOrNil ifTrue:[^distance].
	self polylines do:[:pl | | newDist |
		newDist := pl distanceTo: aPoint select: aSelectBlock.
		
		newDist ifNotNil:[:e |
			e = 0 ifTrue:[^0].
			distance := e min: distance
		] 
	].

	^distance
]

{ #category : #accessing }
SmockGMultiPolylines2D >> polylines [ 

	^ self shapes
]

{ #category : #polylines }
SmockGMultiPolylines2D >> removePolylines [

	self removeShapes
]
