"
A SmockGCompositeShape2DTest is a test class for testing the behavior of SmockGCompositeShape2D
"
Class {
	#name : #SmockGCompositeShape2DTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - GShape'
}

{ #category : #tests }
SmockGCompositeShape2DTest >> testAddChild [

	| gShape |
	gShape := SmockGCompositeShape2D new.
	gShape addChild: SmockGShape2D new.
	self assert: gShape numberOfChildren equals: 1.
	self deny: gShape isEmpty.
	self assert: gShape isNotEmpty.
]

{ #category : #tests }
SmockGCompositeShape2DTest >> testInitialize [

	| gShape |
	gShape := SmockGCompositeShape2D new.
	self assert: gShape isEmpty.
	self deny: gShape isNotEmpty.
	self assert: gShape numberOfChildren equals: 0.
	self assert: gShape isComposite.
	self deny: gShape isDrawable.
]
