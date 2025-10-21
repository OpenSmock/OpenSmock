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
SmockGMultiPolylines2D >> distanceTo: aPoint [

	| dist |
	dist := super distanceTo: aPoint.
	self polylines do:[:pl | | newDist |
		newDist := pl distanceTo: aPoint.
		dist ifNil: [ dist := newDist ] ifNotNil:[ 
			newDist ifNotNil:[ dist := newDist min: dist ] 
		]
	].

	^dist
]

{ #category : #accessing }
SmockGMultiPolylines2D >> polylines [ 

	^ self shapes
]

{ #category : #polylines }
SmockGMultiPolylines2D >> removePolylines [

	self removeShapes
]
