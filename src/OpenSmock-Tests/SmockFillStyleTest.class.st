Class {
	#name : #SmockFillStyleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockFillStyleTest >> testColorEquals [

	self assert: Color blue asSmockFillStyle equals: Color blue asSmockFillStyle.
	self deny: Color red asSmockFillStyle equals: Color blue asSmockFillStyle.
	
	self deny: Color blue asSmockFillStyle equals: Color blue asSmockStrokeStyle.
]
