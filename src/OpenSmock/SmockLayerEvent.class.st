Class {
	#name : #SmockLayerEvent,
	#superclass : #Announcement,
	#instVars : [
		'layerName'
	],
	#category : #'OpenSmock-Events'
}

{ #category : #accessing }
SmockLayerEvent >> layerName [

	^ layerName
]

{ #category : #accessing }
SmockLayerEvent >> layerName: anObject [

	layerName := anObject
]
