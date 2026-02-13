Class {
	#name : #SmockDomainViewLayerEvent,
	#superclass : #SmockDomainViewEvent,
	#instVars : [
		'layer',
		'layerName'
	],
	#category : #'OpenSmock-Bloc-Events'
}

{ #category : #accessing }
SmockDomainViewLayerEvent >> layer [

	^ layer
]

{ #category : #accessing }
SmockDomainViewLayerEvent >> layer: anObject [

	layer := anObject
]

{ #category : #accessing }
SmockDomainViewLayerEvent >> layerName [

	^ layerName
]

{ #category : #accessing }
SmockDomainViewLayerEvent >> layerName: anObject [

	layerName := anObject
]
