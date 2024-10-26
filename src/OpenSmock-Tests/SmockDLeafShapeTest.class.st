Class {
	#name : #SmockDLeafShapeTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDLeafShapeTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDLeafShape new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDLeafShapeTest >> testDrawMode [ 
	
	| dShape |
	dShape := SmockDLeafShape new.

	dShape setDrawModeUser.
	self assert: dShape isDrawModeUser equals: true.
	self assert: dShape isDrawModeDevice equals: false.
	
	dShape setDrawModeDevice.
	self assert: dShape isDrawModeUser equals: false.
	self assert: dShape isDrawModeDevice equals: true.
	
	dShape drawMode: nil.
	self assert: dShape isDrawModeUser equals: true.
	self assert: dShape isDrawModeDevice equals: false.
	
	dShape drawMode: #anotherMode.
	self assert: dShape drawMode equals: #anotherMode.
	self assert: dShape isDrawModeUser equals: false.
	self assert: dShape isDrawModeDevice equals: false.
]

{ #category : #tests }
SmockDLeafShapeTest >> testFillColor [

	| dShape |
	dShape := SmockDLeafShape new.
	dShape fillColor: Color blue.
	self assert: dShape fillPaint equals: Color blue.
]

{ #category : #tests }
SmockDLeafShapeTest >> testFillPaint [

	| dShape |
	dShape := SmockDLeafShape new.
	self assert: dShape fillPaint isNil
]

{ #category : #tests }
SmockDLeafShapeTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDLeafShape new.
	self assert: dShape isLeaf.
	self deny: dShape isComposite.
	self deny: dShape isDrawModeDevice.
	self assert: dShape isDrawModeUser.
	self deny: dShape isTranslatedByParent.
	self assert: dShape fillStyle equals: nil.
	self assert: dShape strokeStyle equals: nil.
	self deny: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDLeafShapeTest >> testIsTranslatedByParent [

	| dShape |
	dShape := SmockDLeafShape new.
	self deny: dShape isTranslatedByParent.
	
	dShape isTranslatedByParent: true.
	self assert: dShape isTranslatedByParent.
	
	dShape isTranslatedByParent: false.
	self deny: dShape isTranslatedByParent.
	
	dShape isTranslatedByParent: nil.
	self deny: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokeColor [

	| dShape |
	dShape := SmockDLeafShape new.
	dShape strokeColor: Color blue.
	self assert: dShape strokePaint equals: Color blue.
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokePaint [

	| dShape |
	dShape := SmockDLeafShape new.
	self assert: dShape strokePaint isNil
]

{ #category : #tests }
SmockDLeafShapeTest >> testStrokeWidth [

	| dShape |
	dShape := SmockDLeafShape new.
	self assert: dShape strokeWidth isNil.
	
	dShape strokeWidth: 20.
	self assert: dShape strokeWidth equals: 20.
]
