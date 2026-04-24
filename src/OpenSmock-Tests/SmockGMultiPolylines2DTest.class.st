Class {
	#name : #SmockGMultiPolylines2DTest,
	#superclass : #SmockGMultiShapes2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGMultiPolylines2DTest >> beDrawable [

	super beDrawable.

	gShape addShape: SmockGPolyline2D new
]

{ #category : #running }
SmockGMultiPolylines2DTest >> gShapeClass [

	^ SmockGMultiPolylines2D
]

{ #category : #tests }
SmockGMultiPolylines2DTest >> testDistanceTo [ 

	| listPoints1 listPoints2 listPoints3  gPolyline1 gPolyline2 gPolyline3|
	
	gShape fillStyle: Color blue asSmockFillStyle.
	listPoints1 := OrderedCollection with: 0@0 with: 10@0.
	listPoints2 := OrderedCollection with: 10@0 with: 10@10.
	listPoints3 := OrderedCollection with: 10@10 with: 0@10.
	gPolyline1 := SmockGPolyline2D new.
	gPolyline1 points: listPoints1.
	gPolyline2 := SmockGPolyline2D new.
	gPolyline2 points: listPoints2.
	gPolyline3 := SmockGPolyline2D new.
	gPolyline3 points: listPoints3.
	
	gShape addPolylines: (OrderedCollection with: gPolyline1 with: gPolyline2 with: gPolyline3).
	
	self assert: gShape isDrawable.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@0) equals: 0.
	self assert: (gShape distanceTo: 10@5) equals: 0.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@10) equals: 0.
	self assert: (gShape distanceTo: 15@10) equals: 5.
	self assert: (gShape distanceTo: 0@(5 negated)) equals: 5.
]
