Class {
	#name : #SmockLayeredViewTest,
	#superclass : #TestCase,
	#instVars : [
		'view'
	],
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #running }
SmockLayeredViewTest >> setUp [
	super setUp.

	view := SmockTestLayeredView new
]

{ #category : #tests }
SmockLayeredViewTest >> testViewInfos [

	| viewInfos |
	viewInfos := view viewInfos.
	self assert: viewInfos notNil.
	self assert: viewInfos origin equals: 0 asPoint.
	self assert: viewInfos extent equals: 100 asPoint.
	
	view viewInfos: SmockViewInfos new.
	viewInfos := view viewInfos.
	self assert: viewInfos notNil.
	self assert: viewInfos origin equals: 0 asPoint.
	self assert: viewInfos extent equals: 100 asPoint.
]
