"
A SmockViewInfosTest is a test class for testing the behavior of SmockViewInfos
"
Class {
	#name : #SmockViewInfosTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #tests }
SmockViewInfosTest >> testInitialize [

	| infos |
	infos := SmockViewInfos new.
	self assert: infos extent equals: 0@0.
	self assert: infos origin equals: 0@0.
	self assert: infos center equals: 0@0.
	self assert: infos width equals: 0.
	self assert: infos height equals: 0.
]

{ #category : #tests }
SmockViewInfosTest >> testupdate [

	| infos |
	infos := SmockViewInfos new.
	infos update.
]
