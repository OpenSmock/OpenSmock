"
A TechView2DCoordinatesTest is a test class for testing the behavior of TechView2DCoordinates
"
Class {
	#name : #SmockUnits2DCoordinatesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testInitialize [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates new.
	self assert: coordinates is2D.
	self deny: coordinates is3D.
	self assert: coordinates xUnitValue isNil.
	self assert: coordinates yUnitValue isNil.
]

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testX [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates new.
	self assert: coordinates x isNil.
	
	coordinates xUnitValue: 1 meter.
	self assert: coordinates x equals: 1.
	
]

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testXUnitValueYUnitValueConstructor [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates xUnitValue: 1 meters yUnitValue: 1 megahertz.
	self assert: coordinates xUnitValue equals: 1 meters.
	self assert: coordinates yUnitValue equals: 1 megahertz.
]

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testXYConstructor [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates x: 1 meters y: 1 megahertz.
	self assert: coordinates xUnitValue equals: 1 meters.
	self assert: coordinates yUnitValue equals: 1 megahertz.
]

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testY [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates new.
	self assert: coordinates y isNil.
	
	coordinates yUnitValue: 1 meter.
	self assert: coordinates y equals: 1.
	
]

{ #category : #tests }
SmockUnits2DCoordinatesTest >> testZeroConstructor [ 

	| coordinates |
	coordinates := SmockUnits2DCoordinates zero.
	self assert: coordinates xUnitValue equals: 0 pixel.
	self assert: coordinates yUnitValue equals: 0 pixel.
]
