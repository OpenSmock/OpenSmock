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
	
	gShape strokeStyle: Color blue asSmockStrokeStyle.
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
	
	"test limit on the left: polyline is not closed should return a positive distance"
	self assert: (gShape distanceTo: 0@5) equals: 5.
	
	"test inside the perimeter"
	self assert: (gShape distanceTo: 2@2) equals: 2.
	self assert: (gShape distanceTo: 5@5) equals: 5.
	self assert: (gShape distanceTo: 8@8) equals: 2.
	
	"test outside the perimeter"
	self assert: ((gShape distanceTo: (2 negated asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12@(-2))) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12 asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: ((-2)@(12))) closeTo: 2.8 precision: 0.1).
]
