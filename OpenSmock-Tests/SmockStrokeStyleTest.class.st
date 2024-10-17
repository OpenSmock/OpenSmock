Class {
	#name : #SmockStrokeStyleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockStrokeStyleTest >> testBeOutskirtsCentered [

	| style |
	style := SmockStrokeStyle new.
	style outskirts: #inside. "need to change default values"
	self deny: style outskirts equals: #centered.
	
	style beOutskirtsCentered.
	self assert: style outskirts equals: #centered.
]

{ #category : #tests }
SmockStrokeStyleTest >> testBeOutskirtsInside [

	| style |
	style := SmockStrokeStyle new.
	style beOutskirtsInside.
	self assert: style outskirts equals: #inside.
]

{ #category : #tests }
SmockStrokeStyleTest >> testBeOutskirtsOutside [

	| style |
	style := SmockStrokeStyle new.
	style beOutskirtsOutside.
	self assert: style outskirts equals: #outside.
]

{ #category : #tests }
SmockStrokeStyleTest >> testColorEquals [

	self assert: Color blue asSmockStrokeStyle equals: Color blue asSmockStrokeStyle.
	self deny: Color red asSmockStrokeStyle equals: Color blue asSmockStrokeStyle.
	
	self deny: Color blue asSmockFillStyle equals: Color blue asSmockStrokeStyle.
]

{ #category : #tests }
SmockStrokeStyleTest >> testDashes [

	| style |
	style := SmockStrokeStyle new.
	style dashes: #(2 3).
	self assert: style dashes equals: #(2 3).
	
	style dashes: nil.
	self assert: style dashes isNil.
]

{ #category : #tests }
SmockStrokeStyleTest >> testInitialize [

	| style |
	style := SmockStrokeStyle new.
	self assert: style paint equals: Color black.
	self assert: style miterLimit equals: 4.
	self assert: style width equals: 1.
	self assert: style dashes isNil.
	self assert: style dashOffset equals: 0.0.
	self assert: style lineJoin equals: #mitter.
	self assert: style lineCap equals: #butt.
	self assert: style outskirts equals: #centered.
]
