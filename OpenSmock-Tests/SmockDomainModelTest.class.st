"
A SmockDomainModelTest is a test class for testing the behavior of SmockDomainModel
"
Class {
	#name : #SmockDomainModelTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Model'
}

{ #category : #tests }
SmockDomainModelTest >> testInitialize [

	| model |
	model := SmockDomainModel new.
	self assert: model symbologyProvider isNil.
	self assert: model viewInfos isNil.
]
