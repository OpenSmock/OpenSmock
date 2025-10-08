"
A SmockDTextTest is a test class for testing the behavior of SmockDText
"
Class {
	#name : #SmockDTextTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDTextTest >> dShapeClass [

	^ SmockDText
]

{ #category : #tests }
SmockDTextTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDTextTest >> testInitialize [ 
	
	super testInitialize.

	self assert: dShape text equals: nil.
	self assert: dShape smockFont equals: nil.
]

{ #category : #tests }
SmockDTextTest >> testIsDrawModeDevice [

	self assert: dShape isDrawModeDevice
]

{ #category : #tests }
SmockDTextTest >> testIsDrawModeUser [

	self deny: dShape isDrawModeUser
]
