Class {
	#name : #SmockDSymbolTest,
	#superclass : #SmockDLeafShapeTest,
	#category : #'OpenSmock-Tests-Cases - DShape'
}

{ #category : #running }
SmockDSymbolTest >> dShapeClass [

	^ SmockDSymbol
]

{ #category : #tests }
SmockDSymbolTest >> testDefaultIsTranslatedByParent [ 
	
	self assert: dShape defaultIsTranslatedByParent
]

{ #category : #tests }
SmockDSymbolTest >> testInitialize [ 
	
	super testInitialize.
	
	self assert: dShape symbolKey equals: nil.
	self assert: dShape orientation equals: 0.
]

{ #category : #tests }
SmockDSymbolTest >> testIsDrawModeDevice [

	self assert: dShape isDrawModeDevice
]

{ #category : #tests }
SmockDSymbolTest >> testIsDrawModeUser [

	self deny: dShape isDrawModeUser
]

{ #category : #tests }
SmockDSymbolTest >> testOrientation [
	
	dShape orientation: 180.
	self assert: dShape orientation equals: 180.
	
	dShape orientation: nil.
	self assert: dShape orientation equals: 0.
]

{ #category : #tests }
SmockDSymbolTest >> testSymbolKey [ 
	
	dShape symbolKey: #mySymbol.
	self assert: dShape symbolKey equals: #mySymbol.
	
	dShape symbolKey: nil.
	self assert: dShape symbolKey equals: nil.
]
