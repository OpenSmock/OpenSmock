Class {
	#name : #SmockLayerEvent,
	#superclass : #Announcement,
	#instVars : [
		'layer',
		'layerName'
	],
	#category : #'OpenSmock-Events'
}

{ #category : #accessing }
SmockLayerEvent >> layer [

	^ layer
]

{ #category : #accessing }
SmockLayerEvent >> layer: anObject [

	layer := anObject
]

{ #category : #accessing }
SmockLayerEvent >> layerName [

	^ layerName
]

{ #category : #accessing }
SmockLayerEvent >> layerName: anObject [

	layerName := anObject
]
