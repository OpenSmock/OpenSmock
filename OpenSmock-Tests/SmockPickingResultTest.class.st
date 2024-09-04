"
A SmockPickingResultTest is a test class for testing the behavior of SmockPickingResult
"
Class {
	#name : #SmockPickingResultTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockPickingResultTest >> testAddPickingElement [

	| pr |
	pr := SmockPickingResult new.
	self assert: pr results size equals: 0.
	
	pr addPickingElement: SmockPickingElement new.
	self assert: pr results size equals: 1.
	
	pr addPickingElement: SmockPickingElement new.
	self assert: pr results size equals: 2
]

{ #category : #tests }
SmockPickingResultTest >> testFirstElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickingElement new.
	pr addPickingElement: pe.
	self assert: pr firstElement equals: pe.
	
	pr addPickingElement: SmockPickingElement new.
	self assert: pr firstElement equals: pe.

]

{ #category : #tests }
SmockPickingResultTest >> testHasJustOneElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickingElement new.
	pr addPickingElement: pe.
	self assert: pr hasJustOneElement.
	
	pr addPickingElement: SmockPickingElement new.
	self deny: pr hasJustOneElement.

]

{ #category : #tests }
SmockPickingResultTest >> testHasMoreElements [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickingElement new.
	pr addPickingElement: pe.
	self deny: pr hasMoreElements.
	
	pr addPickingElement: SmockPickingElement new.
	self assert: pr hasMoreElements.

]

{ #category : #tests }
SmockPickingResultTest >> testIsEmpty [

	| pr |
	pr := SmockPickingResult new.
	self assert: pr isEmpty.
	
	pr addPickingElement: SmockPickingElement new.
	self deny: pr isEmpty.
	
]

{ #category : #tests }
SmockPickingResultTest >> testIsNotEmpty [

	| pr |
	pr := SmockPickingResult new.
	self deny: pr isNotEmpty.
	
	pr addPickingElement: SmockPickingElement new.
	self assert: pr isNotEmpty.
	
]

{ #category : #tests }
SmockPickingResultTest >> testLastElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickingElement new.
	pr addPickingElement: pe.
	self assert: pr lastElement equals: pe.
	
	pr addPickingElement: SmockPickingElement new.
	self deny: pr lastElement equals: pe.

]

{ #category : #tests }
SmockPickingResultTest >> testPrintString [

	| pr |
	pr := SmockPickingResult new.
	pr printString.
	
	pr addPickingElement: SmockPickingElement new.
	pr printString.
]

{ #category : #tests }
SmockPickingResultTest >> testRemovePickingElement [

	| pr e1 e2 |
	pr := SmockPickingResult new.
	e1 := SmockPickingElement new.
	pr addPickingElement: e1.	
	e2 := SmockPickingElement new.
	pr addPickingElement: e2.	
	self assert: pr results size equals: 2.
	
	pr removePickingElement: e2.
	self assert: pr results size equals: 1.
	
	pr removePickingElement: e1.
	self assert: pr results size equals: 0.
]
