Class {
	#name : #SmockDShapeTest,
	#superclass : #TestCase,
	#instVars : [
		'dShape'
	],
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #testing }
SmockDShapeTest class >> isAbstract [ 

	^ self == SmockDShapeTest 
]

{ #category : #running }
SmockDShapeTest >> dShapeClass [

	^ SmockDShape
]

{ #category : #running }
SmockDShapeTest >> setUp [

	super setUp.
	dShape := self dShapeClass new
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
	self deny: dShapeCopy identicalTo: dShape
]

{ #category : #tests }
SmockDShapeTest >> testDefaultIsTranslatedByParent [ 
	
	self deny: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDShapeTest >> testDisplayFilter [

	| filter |
	self assert: dShape displayFilter isNil.

	filter := SmockAttributeList new.
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
SmockDShapeTest >> testEffect [

	self assert: dShape effect isNil.

	dShape effect: SmockBackgroundEffect new.
	self assert: dShape effect notNil.

	dShape effect: nil.
	self assert: dShape effect isNil
]

{ #category : #tests }
SmockDShapeTest >> testInitialize [ 
	
	self assert: dShape key equals: nil.
	self assert: dShape coordinates equals: nil.
	self assert: dShape isVisible.
	self deny: dShape isSelected.
	self assert: dShape zIndex equals: 0.
	self assert: dShape coordinatesDeviceOffset isNil.
]

{ #category : #tests }
SmockDShapeTest >> testIsComposite [

	self deny: dShape isComposite
]

{ #category : #tests }
SmockDShapeTest >> testIsDrawModeDevice [

	self deny: dShape isDrawModeDevice
]

{ #category : #tests }
SmockDShapeTest >> testIsDrawModeUser [

	self assert: dShape isDrawModeUser
]

{ #category : #tests }
SmockDShapeTest >> testIsLeaf [

	self assert: dShape isLeaf
]

{ #category : #tests }
SmockDShapeTest >> testIsSelected [
	
	self assert: dShape isSelected not.
	
	dShape isSelected: true.
	self assert: dShape isSelected.
]

{ #category : #tests }
SmockDShapeTest >> testIsTranslatedByParent [

	self
		assert: dShape isTranslatedByParent
		equals: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDShapeTest >> testIsTranslatedByParentChange [

	dShape isTranslatedByParent: true.
	self assert: dShape isTranslatedByParent.

	dShape isTranslatedByParent: false.
	self deny: dShape isTranslatedByParent.

	dShape isTranslatedByParent: nil.
	self assert: dShape isTranslatedByParent notNil.
	self
		assert: dShape isTranslatedByParent
		equals: dShape defaultIsTranslatedByParent
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
