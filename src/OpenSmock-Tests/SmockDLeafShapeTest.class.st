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
SmockDLeafShapeTest >> testInitialize [ 
	
	super testInitialize.
	
	self deny: dShape isComposite.
	self assert: dShape fillStyle equals: nil.
	self assert: dShape strokeStyle equals: nil.
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
SmockDLeafShapeTest >> testStrokeWidth [

	self assert: dShape strokeWidth isNil.
	
	dShape strokeWidth: 20.
	self assert: dShape strokeWidth equals: 20.
]
