Class {
	#name : #SmockPickedElement,
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
	#category : #'OpenSmock-Picking'
}

{ #category : #accessing }
SmockPickedElement >> dShape [
	^ dShape
]

{ #category : #accessing }
SmockPickedElement >> dShape: anObject [
	dShape := anObject
]

{ #category : #accessing }
SmockPickedElement >> distanceInPixels [
	^ distanceInPixels
]

{ #category : #accessing }
SmockPickedElement >> distanceInPixels: anObject [
	distanceInPixels := anObject
]

{ #category : #accessing }
SmockPickedElement >> gShape [
	^ gShape
]

{ #category : #accessing }
SmockPickedElement >> gShape: anObject [
	gShape := anObject
]

{ #category : #accessing }
SmockPickedElement >> layerLevel [
	^ layerLevel
]

{ #category : #accessing }
SmockPickedElement >> layerLevel: anObject [
	layerLevel := anObject
]

{ #category : #accessing }
SmockPickedElement >> layerName [
	^ layerName
]

{ #category : #accessing }
SmockPickedElement >> layerName: anObject [
	layerName := anObject
]

{ #category : #accessing }
SmockPickedElement >> object [
	"Warning: this var is certainly nil because we can store a lot of object duplication in all picked views. Use index to refer to the right object reference"

	^ object
]

{ #category : #accessing }
SmockPickedElement >> object: anObject [

	object := anObject
]

{ #category : #accessing }
SmockPickedElement >> objectIndex [

	^ objectIndex
]

{ #category : #accessing }
SmockPickedElement >> objectIndex: anObject [

	objectIndex := anObject
]

{ #category : #accessing }
SmockPickedElement >> objectKey [

	self deprecated:'use objectIndex'.
	^ self objectIndex 
]

{ #category : #accessing }
SmockPickedElement >> objectKey: anObject [

	self deprecated:'use objectIndex'.
	self objectIndex: anObject
]
