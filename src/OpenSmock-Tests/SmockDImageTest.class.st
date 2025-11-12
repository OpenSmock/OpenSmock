"
A SmockDImageTest is a test class for testing the behavior of SmockDImage
"
Class {
	#name : #SmockDImageTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDImageTest >> dShapeClass [ 

	^ SmockDImage 
]

{ #category : #tests }
SmockDImageTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDImageTest >> testImage [

	| image |
	image := Form new.
	dShape image: image.
	self assert: dShape image equals: image.

	dShape image: nil.
	self assert: dShape image isNil
]

{ #category : #tests }
SmockDImageTest >> testInitialize [ 
	
	super testInitialize.

	self assert: dShape image isNil.
	self assert: dShape orientation equals: 0.
	self assert: dShape scale equals: 1@1.
]

{ #category : #tests }
SmockDImageTest >> testIsDrawModeDevice [

	self assert: dShape isDrawModeDevice
]

{ #category : #tests }
SmockDImageTest >> testIsDrawModeUser [

	self deny: dShape isDrawModeUser
]

{ #category : #tests }
SmockDImageTest >> testOrientation [

	dShape scale: 2@2.
	self assert: dShape scale equals: 2@2.

	dShape scale: nil.
	self assert: dShape scale equals: 1@1
]
