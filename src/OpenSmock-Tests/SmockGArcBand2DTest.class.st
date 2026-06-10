Class {
	#name : #SmockGArcBand2DTest,
	#superclass : #SmockGLeafShape2DTest,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #private }
SmockGArcBand2DTest >> beDrawable [

	super beDrawable.

	gShape position: 0 @ 0.
	gShape from: 0 @ 0.
	gShape to: 10 @ 10.
	gShape radiusMin: 10.
	gShape radiusMax: 15
]

{ #category : #running }
SmockGArcBand2DTest >> gShapeClass [

	^ SmockGArcBand2D
]

{ #category : #tests }
SmockGArcBand2DTest >> testFromInDegrees [

	self assert: gShape fromInDegrees isNil.

	gShape fromInDegrees: 50.
	self assert: gShape fromInDegrees equals: 50
]

{ #category : #tests }
SmockGArcBand2DTest >> testIsDrawable [

	super testIsDrawable.

	gShape radiusMin: 0.
	gShape radiusMax: 0.
	gShape fromInDegrees: 0.
	gShape toInDegrees: 0.
	self deny: gShape isDrawable.

	gShape radiusMin: 10.
	gShape radiusMax: 20.
	gShape fromInDegrees: 0.
	gShape toInDegrees: 90.
	self assert: gShape isDrawable
]

{ #category : #tests }
SmockGArcBand2DTest >> testRadiusMax [

	self assert: gShape radiusMax isNil.

	gShape radiusMax: 50.
	self assert: gShape radiusMax equals: 50
]

{ #category : #tests }
SmockGArcBand2DTest >> testRadiusMin [ 

	self assert: gShape radiusMin isNil.

	gShape radiusMin: 50.
	self assert: gShape radiusMin equals: 50
]

{ #category : #tests }
SmockGArcBand2DTest >> testToInDegrees [

	self assert: gShape toInDegrees isNil.

	gShape toInDegrees: 50.
	self assert: gShape toInDegrees equals: 50
]
