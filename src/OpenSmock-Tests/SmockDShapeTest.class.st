Class {
	#name : #SmockDShapeTest,
	#superclass : #TestCase,
	#instVars : [
		'dShape'
	],
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDShapeTest >> setUp [

	super setUp.
	dShape := SmockDShape new
]

{ #category : #tests }
SmockDShapeTest >> testCoordinates [ 
	
	self assert: dShape coordinates isNil.
	
	dShape coordinates: 0@0.
	self assert: dShape coordinates equals: 0@0.
]

{ #category : #tests }
SmockDShapeTest >> testCoordinatesDeviceOffset [ 
	
	self assert: dShape coordinatesDeviceOffset isNil.
	
	dShape coordinatesDeviceOffset: 0@0.
	self assert: dShape coordinatesDeviceOffset equals: 0@0.
]

{ #category : #tests }
SmockDShapeTest >> testCopy [ 
	
	| dShapeCopy |
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDShapeTest >> testDefaultIsTranslatedByParent [ 
	
	self deny: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDShapeTest >> testDisplayFilter [

	| filter |
	self assert: dShape displayFilter isNil.

	filter := SmockAttributesDisplayFilter new.
	dShape displayFilter: filter.
	self assert: dShape displayFilter equals: filter.
	
	dShape displayFilter: nil.
	self assert: dShape displayFilter isNil.
]

{ #category : #tests }
SmockDShapeTest >> testDrawMode [

	self assert: dShape drawMode equals: dShape defaultDrawMode.
	self assert: dShape isDrawModeUser.
]

{ #category : #tests }
SmockDShapeTest >> testInitialize [ 
	
	self assert: dShape key equals: nil.
	self assert: dShape coordinates equals: nil.
	self assert: dShape isVisible equals: true.
	self assert: dShape isSelected equals: false.
	self assert: dShape isLeaf equals: false.
	self assert: dShape isComposite equals: false.
	self assert: dShape zIndex equals: 0.
	self deny: dShape isTranslatedByParent.
	self assert: dShape coordinatesDeviceOffset isNil.
]

{ #category : #tests }
SmockDShapeTest >> testIsSelected [
	
	self assert: dShape isSelected not.
	
	dShape isSelected: true.
	self assert: dShape isSelected.
]

{ #category : #tests }
SmockDShapeTest >> testIsTranslatedByParent [
	
	dShape isTranslatedByParent: false.
	self deny: dShape isTranslatedByParent.
]

{ #category : #tests }
SmockDShapeTest >> testIsVisible [
	
	self assert: dShape isVisible.
	
	dShape isVisible: false.
	self deny: dShape isVisible
]

{ #category : #tests }
SmockDShapeTest >> testKey [ 
	
	dShape key: #testDShape.
	self assert: dShape key equals: #testDShape.
]

{ #category : #tests }
SmockDShapeTest >> testSetDrawModeDevice [

	dShape setDrawModeDevice.
	self assert: dShape isDrawModeDevice 
]

{ #category : #tests }
SmockDShapeTest >> testSetDrawModeUser [

	dShape setDrawModeUser.
	self assert: dShape isDrawModeUser
]

{ #category : #tests }
SmockDShapeTest >> testZIndex [
	
	self assert: dShape zIndex equals: 0.
	
	dShape zIndex: 2.
	self assert: dShape zIndex equals: 2
]
