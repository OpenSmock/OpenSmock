Class {
	#name : #SmockStrokeStyleTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockStrokeStyleTest >> testColorEquals [

	self assert: Color blue asSmockStrokeStyle equals: Color blue asSmockStrokeStyle.
	self deny: Color red asSmockStrokeStyle equals: Color blue asSmockStrokeStyle.
	
	self deny: Color blue asSmockFillStyle equals: Color blue asSmockStrokeStyle.
]
