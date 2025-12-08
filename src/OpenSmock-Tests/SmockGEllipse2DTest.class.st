"
A SmockGEllipse2DTest is a test class for testing the behavior of SmockGEllipse2D
"
Class {
	#name : #SmockGEllipse2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #running }
SmockGEllipse2DTest >> gShapeClass [

	^ SmockGEllipse2D 
]

{ #category : #tests }
SmockGEllipse2DTest >> testIsDrawable [

	super testIsDrawable.

	gShape position: 0@0.
	gShape fillStyle: Color red asSmockFillStyle.
	self deny: gShape isDrawable.
	
	gShape radius1: 10.
	gShape radius2: 20.
	self assert: gShape isDrawable.
]

{ #category : #tests }
SmockGEllipse2DTest >> testRadius1 [

	self assert: gShape radius1 isNil.

	gShape radius1: 50.
	self assert: gShape radius1 equals: 50
]

{ #category : #tests }
SmockGEllipse2DTest >> testRadius2 [

	self assert: gShape radius2 isNil.

	gShape radius2: 50.
	self assert: gShape radius2 equals: 50
]

{ #category : #tests }
SmockGEllipse2DTest >> testRotation [

	self assert: gShape rotation isNil.

	gShape rotation: 90.
	self assert: gShape rotation equals: 90
]

{ #category : #tests }
SmockGEllipse2DTest >> testRotationInDegrees [

	self assert: gShape rotationInDegrees isNil.

	gShape rotationInDegrees: 90.
	self assert: gShape rotationInDegrees equals: 90
]
