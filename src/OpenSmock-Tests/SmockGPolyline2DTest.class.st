Class {
	#name : #SmockGPolyline2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGPolyline2DTest >> beDrawable [

	super beDrawable.

	gShape points: #( 0@0 1@1 2@2 ).
]

{ #category : #running }
SmockGPolyline2DTest >> gShapeClass [

	^ SmockGPolyline2D
]

{ #category : #tests }
SmockGPolyline2DTest >> testDistanceTo [ 

	| listPoints |
	
	gShape fillStyle: Color blue asSmockFillStyle.
	listPoints := OrderedCollection with: 0@0 with: 10@0 with: 10@10.
	listPoints add: 0@10.
	gShape points: listPoints.
	
	self assert: gShape isDrawable.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@0) equals: 0.
	self assert: (gShape distanceTo: 10@5) equals: 0.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@10) equals: 0.
	self assert: (gShape distanceTo: 15@10) equals: 5.
	self assert: (gShape distanceTo: 0@(5 negated)) equals: 5.
]