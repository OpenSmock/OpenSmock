Class {
	#name : #SmockUnits3DCoordinatesTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockUnits3DCoordinatesTest >> testInitialize [ 

	| coordinates |
	coordinates := SmockUnits3DCoordinates new.
	self deny: coordinates is2D.
	self assert: coordinates is3D.
	self assert: coordinates xUnitValue isNil.
	self assert: coordinates yUnitValue isNil.
	self assert: coordinates zUnitValue isNil.
]

{ #category : #tests }
SmockUnits3DCoordinatesTest >> testXUnitValueYUnitValueZUnitValueConstructor [ 

	| coordinates |
	coordinates := SmockUnits3DCoordinates xUnitValue: 1 meters yUnitValue: 1 megahertz zUnitValue: 1 arcdegree.
	self assert: coordinates xUnitValue equals: 1 meters.
	self assert: coordinates yUnitValue equals: 1 megahertz.
	self assert: coordinates zUnitValue equals: 1 arcdegree.
]

{ #category : #tests }
SmockUnits3DCoordinatesTest >> testXYZConstructor [ 

	| coordinates |
	coordinates := SmockUnits3DCoordinates x: 1 meters y: 1 megahertz z: 1 arcdegree.
	self assert: coordinates xUnitValue equals: 1 meters.
	self assert: coordinates yUnitValue equals: 1 megahertz.
	self assert: coordinates zUnitValue equals: 1 arcdegree.
]

{ #category : #tests }
SmockUnits3DCoordinatesTest >> testZ [

	| coordinates |
	coordinates := SmockUnits3DCoordinates new.
	self assert: coordinates z isNil.
	
	coordinates zUnitValue: 1 meter.
	self assert: coordinates z equals: 1.
	
]

{ #category : #tests }
SmockUnits3DCoordinatesTest >> testZeroConstructor [ 

	| coordinates |
	coordinates := SmockUnits3DCoordinates zero.
	self assert: coordinates xUnitValue equals: 0 pixel.
	self assert: coordinates yUnitValue equals: 0 pixel.
	self assert: coordinates zUnitValue equals: 0 pixel.
]
