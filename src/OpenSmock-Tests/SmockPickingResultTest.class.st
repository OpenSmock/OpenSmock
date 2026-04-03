"
A SmockPickingResultTest is a test class for testing the behavior of SmockPickingResult
"
Class {
	#name : #SmockPickingResultTest,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : #'OpenSmock-Tests-Picking'
}

{ #category : #testing }
SmockPickingResultTest class >> isAbstract [ 

	^ self == SmockPickingResultTest 
]

{ #category : #running }
SmockPickingResultTest >> pickingResultClass [

	^ self subclassResponsibility 
]

{ #category : #running }
SmockPickingResultTest >> setUp [

	super setUp.

	result := self pickingResultClass new
]

{ #category : #tests }
SmockPickingResultTest >> testAddPickedElement [

	| pr |
	pr := SmockPickingResult new.
	self assert: pr results size equals: 0.

	pr addPickedElement: SmockPickedElement new.
	self assert: pr results size equals: 1.

	pr addPickedElement: SmockPickedElement new.
	self assert: pr results size equals: 2
]

{ #category : #tests }
SmockPickingResultTest >> testFirstElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickedElement new.
	pr addPickedElement: pe.
	self assert: pr firstElement equals: pe.

	pr addPickedElement: SmockPickedElement new.
	self assert: pr firstElement equals: pe
]

{ #category : #tests }
SmockPickingResultTest >> testHasJustOneElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickedElement new.
	pr addPickedElement: pe.
	self assert: pr hasJustOneElement.

	pr addPickedElement: SmockPickedElement new.
	self deny: pr hasJustOneElement
]

{ #category : #tests }
SmockPickingResultTest >> testHasMoreElements [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickedElement new.
	pr addPickedElement: pe.
	self deny: pr hasMoreElements.

	pr addPickedElement: SmockPickedElement new.
	self assert: pr hasMoreElements
]

{ #category : #tests }
SmockPickingResultTest >> testIsEmpty [

	| pr |
	pr := SmockPickingResult new.
	self assert: pr isEmpty.

	pr addPickedElement: SmockPickedElement new.
	self deny: pr isEmpty
]

{ #category : #tests }
SmockPickingResultTest >> testIsNotEmpty [

	| pr |
	pr := SmockPickingResult new.
	self deny: pr isNotEmpty.

	pr addPickedElement: SmockPickedElement new.
	self assert: pr isNotEmpty
]

{ #category : #tests }
SmockPickingResultTest >> testLastElement [

	| pr pe |
	pr := SmockPickingResult new.
	pe := SmockPickedElement new.
	pr addPickedElement: pe.
	self assert: pr lastElement equals: pe.

	pr addPickedElement: SmockPickedElement new.
	self deny: pr lastElement equals: pe
]

{ #category : #tests }
SmockPickingResultTest >> testPickableGShapeBlock [

	self assert: result pickableGShapeBlock notNil.

	result pickableGShapeBlock: nil.
	self assert: result pickableGShapeBlock notNil.
	
	
]

{ #category : #tests }
SmockPickingResultTest >> testPickingDistanceBlock [

	self assert: result pickingDistanceBlock notNil.

	result pickingDistanceBlock: nil.
	self assert: result pickingDistanceBlock notNil
]

{ #category : #tests }
SmockPickingResultTest >> testPrintString [

	| pr |
	pr := SmockPickingResult new.
	pr printString.

	pr addPickedElement: SmockPickedElement new.
	pr printString
]

{ #category : #tests }
SmockPickingResultTest >> testRemovePickedElement [

	| pr e1 e2 |
	pr := SmockPickingResult new.
	e1 := SmockPickedElement new.
	pr addPickedElement: e1.
	e2 := SmockPickedElement new.
	pr addPickedElement: e2.
	self assert: pr results size equals: 2.

	pr removePickedElement: e2.
	self assert: pr results size equals: 1.

	pr removePickedElement: e1.
	self assert: pr results size equals: 0
]
