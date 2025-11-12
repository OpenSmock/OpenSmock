"
A SmockDEllipseTest is a test class for testing the behavior of SmockDEllipse
"
Class {
	#name : #SmockDEllipseTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDEllipseTest >> dShapeClass [ 

	^ SmockDEllipse
]

{ #category : #tests }
SmockDEllipseTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDEllipseTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape radius1 equals: nil.
	self assert: dShape radius2 equals: nil.
	self assert: dShape orientation equals: nil.
]
