Class {
	#name : #SmockDLeafShapeTest,
	#superclass : #SmockDShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #testing }
SmockDLeafShapeTest class >> isAbstract [ 

	^ self == SmockDLeafShapeTest 
]

{ #category : #running }
SmockDLeafShapeTest >> dShapeClass [

	^ SmockDLeafShape
]

{ #category : #tests }
SmockDLeafShapeTest >> testDrawMode [

	dShape setDrawModeUser.
	self assert: dShape isDrawModeUser.
	self deny: dShape isDrawModeDevice.

	dShape setDrawModeDevice.
	self deny: dShape isDrawModeUser.
	self assert: dShape isDrawModeDevice.

	dShape drawMode: nil.
	self assert: dShape drawMode notNil.
	self assert: dShape drawMode equals: dShape defaultDrawMode.

	dShape drawMode: #anotherMode.
	self assert: dShape drawMode equals: #anotherMode.
	self deny: dShape isDrawModeUser.
	self deny: dShape isDrawModeDevice
]

{ #category : #tests }
SmockDLeafShapeTest >> testFillColor [

	dShape fillColor: Color blue.
	self assert: dShape fillPaint equals: Color blue.
]

{ #category : #tests }
SmockDLeafShapeTest >> testFillPaint [

	self assert: dShape fillPaint isNil
]

{ #category : #tests }
SmockDLeafShapeTest >> testFillStyle [

	self assert: dShape fillStyle isNil.

	dShape fillStyle: Color blue asSmockFillStyle.
	self assert: dShape fillStyle equals: (Color blue asSmockFillStyle).
	
	dShape fillStyle: nil.
	self assert: dShape fillStyle isNil.
]

{ #category : #tests }
SmockDLeafShapeTest >> testInitialize [ 
	
	super testInitialize.
	
	self deny: dShape isComposite.
]

{ #category : #tests }
SmockDLeafShapeTest >> testIsTransparent [

	self assert: dShape isTransparent.

	dShape strokeStyle: Color blue asSmockStrokeStyle.
	dShape fillStyle: Color green asSmockFillStyle.
	self deny: dShape isTransparent.
	
	dShape strokeStyle: nil.
	dShape fillStyle: Color green asSmockFillStyle.
	self deny: dShape isTransparent.

	dShape strokeStyle: Color blue asSmockStrokeStyle.
	dShape fillStyle: nil.
	self deny: dShape isTransparent.

	dShape strokeStyle: nil.
	dShape fillStyle: nil.
	self assert: dShape isTransparent.
	
	dShape strokeStyle: (Color blue alpha: 0) asSmockStrokeStyle.
	dShape fillStyle: (Color green alpha: 0) asSmockFillStyle.
	self assert: dShape isTransparent.
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokeColor [

	dShape strokeColor: Color blue.
	self assert: dShape strokePaint equals: Color blue.
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokePaint [

	self assert: dShape strokePaint isNil
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokeStyle [

	self assert: dShape strokeStyle isNil.

	dShape strokeStyle: Color blue asSmockStrokeStyle.
	self assert: dShape strokeStyle equals: (Color blue asSmockStrokeStyle).
	
	dShape strokeStyle: nil.
	self assert: dShape strokeStyle isNil.
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokeWidth [

	self assert: dShape strokeWidth isNil.
	
	dShape strokeWidth: 20.
	self assert: dShape strokeWidth equals: 20.
]
