Class {
	#name : #SmockPickingElement,
	#superclass : #Object,
	#instVars : [
		'distanceInPixels',
		'dShape',
		'gShape',
		'layerLevel',
		'layerName',
		'objectIndex',
		'object'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockPickingElement >> dShape [
	^ dShape
]

{ #category : #accessing }
SmockPickingElement >> dShape: anObject [
	dShape := anObject
]

{ #category : #accessing }
SmockPickingElement >> distanceInPixels [
	^ distanceInPixels
]

{ #category : #accessing }
SmockPickingElement >> distanceInPixels: anObject [
	distanceInPixels := anObject
]

{ #category : #accessing }
SmockPickingElement >> gShape [
	^ gShape
]

{ #category : #accessing }
SmockPickingElement >> gShape: anObject [
	gShape := anObject
]

{ #category : #accessing }
SmockPickingElement >> layerLevel [
	^ layerLevel
]

{ #category : #accessing }
SmockPickingElement >> layerLevel: anObject [
	layerLevel := anObject
]

{ #category : #accessing }
SmockPickingElement >> layerName [
	^ layerName
]

{ #category : #accessing }
SmockPickingElement >> layerName: anObject [
	layerName := anObject
]

{ #category : #accessing }
SmockPickingElement >> object [
	"Warning: this var is certainly nil because we can store a lot of object duplication in all picked views. Use index to refer to the right object reference"

	^ object
]

{ #category : #accessing }
SmockPickingElement >> object: anObject [

	object := anObject
]

{ #category : #accessing }
SmockPickingElement >> objectIndex [

	^ objectIndex
]

{ #category : #accessing }
SmockPickingElement >> objectIndex: anObject [

	objectIndex := anObject
]

{ #category : #accessing }
SmockPickingElement >> objectKey [

	self deprecated:'use objectIndex'.
	^ self objectIndex 
]

{ #category : #accessing }
SmockPickingElement >> objectKey: anObject [

	self deprecated:'use objectIndex'.
	self objectIndex: anObject
]
