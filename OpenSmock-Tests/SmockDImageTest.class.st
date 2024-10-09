"
A SmockDImageTest is a test class for testing the behavior of SmockDImage
"
Class {
	#name : #SmockDImageTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #tests }
SmockDImageTest >> testCopy [ 
	
	| dShape dShapeCopy |
	dShape := SmockDImage new.
	dShapeCopy := dShape copy.
	
	self assert: dShapeCopy equals: dShape.
	self assert: (dShapeCopy == dShape) equals: false.
]

{ #category : #tests }
SmockDImageTest >> testImage [

	| dShape image |
	image := Form new.
	dShape := SmockDImage new.
	dShape image: image.
	self assert: dShape image equals: image.

	dShape image: nil.
	self assert: dShape image isNil
]

{ #category : #tests }
SmockDImageTest >> testInitialize [ 
	
	| dShape |
	dShape := SmockDImage new.
	self assert: dShape image isNil.
	self assert: dShape orientation equals: 0.
	self assert: dShape scale equals: 1@1.
]

{ #category : #tests }
SmockDImageTest >> testOrientation [

	| dShape |
	dShape := SmockDImage new.
	dShape scale: 2@2.
	self assert: dShape scale equals: 2@2.

	dShape scale: nil.
	self assert: dShape scale equals: 1@1
]
