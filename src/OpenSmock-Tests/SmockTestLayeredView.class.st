Class {
	#name : #SmockTestLayeredView,
	#superclass : #Object,
	#traits : 'TSmockLayeredView',
	#classTraits : 'TSmockLayeredView classTrait',
	#category : #'OpenSmock-Tests-Model'
}

{ #category : #private }
SmockTestLayeredView >> updateModel: aViewUpdateChanges [

	"do nothing"
]

{ #category : #private }
SmockTestLayeredView >> updateViewInfos [

	self viewInfos origin: 0@0.
	self viewInfos extent: 100@100.
	self viewInfos update
]
