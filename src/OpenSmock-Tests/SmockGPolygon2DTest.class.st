Class {
	#name : #SmockGPolygon2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGPolygon2DTest >> beDrawable [

	super beDrawable.

	gShape points: #( 0@0 1@1 2@2 ).
]

{ #category : #running }
SmockGPolygon2DTest >> gShapeClass [

	^ SmockGPolygon2D
]

{ #category : #tests }
SmockGPolygon2DTest >> testDistanceTo [ 

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
	
	"test limit on the left: polygone is closed should return a zero distance"
	self assert: (gShape distanceTo: 0@5) equals: 0.
	
	"test inside the perimeter"
	self assert: (gShape distanceTo: 2@2) equals: 0.
	self assert: (gShape distanceTo: 5@5) equals: 0.
	self assert: (gShape distanceTo: 8@8) equals: 0.
	
	"test outside the perimeter"
	self assert: ((gShape distanceTo: (2 negated asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12@(-2))) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12 asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: ((-2)@(12))) closeTo: 2.8 precision: 0.1).
]

{ #category : #tests }
SmockGPolygon2DTest >> testDistanceToWithoutFillStyle [

	| listPoints |
	gShape strokeStyle: Color blue asSmockStrokeStyle.
	gShape fillStyle: nil.
	listPoints := OrderedCollection with: 0@0 with: 10@0 with: 10@10.
	listPoints add: 0@10.
	gShape points: listPoints asArray. "test with an array to considere a variation"
	
	self assert: gShape isDrawable.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@0) equals: 0.
	self assert: (gShape distanceTo: 10@5) equals: 0.
	self assert: (gShape distanceTo: 10@10) equals: 0.
	self assert: (gShape distanceTo: 5@10) equals: 0.
	self assert: (gShape distanceTo: 15@10) equals: 5.
	self assert: (gShape distanceTo: 0@(5 negated)) equals: 5.
	
	"test limit on the left: polygone is closed should return a zero distance"
	self assert: (gShape distanceTo: 0@5) equals: 0.
	
	"test inside the perimeter: polygone hasen't fill and should have same behavior as a polyline"
	self assert: (gShape distanceTo: 2@2) equals: 2.
	self assert: (gShape distanceTo: 5@5) equals: 5.
	self assert: (gShape distanceTo: 8@8) equals: 2.
	
	"test outside the perimeter"
	self assert: ((gShape distanceTo: (2 negated asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12@(-2))) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: (12 asPoint)) closeTo: 2.8 precision: 0.1).
	self assert: ((gShape distanceTo: ((-2)@(12))) closeTo: 2.8 precision: 0.1).
]
