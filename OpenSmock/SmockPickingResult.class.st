Class {
	#name : #SmockPickingResult,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'localPoint',
		'globalPoint',
		'radiusInPixels',
		'results'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #API }
SmockPickingResult >> addPickingElement: aPickingElement [

	self results add: aPickingElement
]

{ #category : #API }
SmockPickingResult >> applyFilter: aBlock [
	"apply a filter on the result list"

	| list |
	list := self results copy select: [ :e | aBlock value: e ].
	self results: list
]

{ #category : #API }
SmockPickingResult >> applyOrder: aSortBlock [
	"apply an order on the result list"

	| list |
	list := self results copy sort: aSortBlock.
	self results: list
]

{ #category : #testing }
SmockPickingResult >> firstElement [

	self isEmpty ifTrue: [ ^ nil ].
	^ self results first
]

{ #category : #API }
SmockPickingResult >> getObjectKeys [

	^ self results collect: [ :e | e objectKey ]
]

{ #category : #API }
SmockPickingResult >> getObjects [

	^ self results collect: [ :e | e object ]
]

{ #category : #accessing }
SmockPickingResult >> globalPoint [
	^ globalPoint
]

{ #category : #accessing }
SmockPickingResult >> globalPoint: anObject [
	globalPoint := anObject
]

{ #category : #testing }
SmockPickingResult >> hasJustOneElement [

	^ self results size = 1
]

{ #category : #testing }
SmockPickingResult >> hasMoreElements [

	^ self results size > 1
]

{ #category : #testing }
SmockPickingResult >> isEmpty [

	^ self results isEmpty
]

{ #category : #testing }
SmockPickingResult >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #testing }
SmockPickingResult >> lastElement [

	self isEmpty ifTrue: [ ^ nil ].
	^ self results last
]

{ #category : #accessing }
SmockPickingResult >> localPoint [
	^ localPoint
]

{ #category : #accessing }
SmockPickingResult >> localPoint: anObject [
	localPoint := anObject
]

{ #category : #accessing }
SmockPickingResult >> radiusInPixels [
	^ radiusInPixels
]

{ #category : #accessing }
SmockPickingResult >> radiusInPixels: anObject [
	radiusInPixels := anObject
]

{ #category : #API }
SmockPickingResult >> removePickingElement: aPickingElement [

	self results remove: aPickingElement
]

{ #category : #accessing }
SmockPickingResult >> results [

	^ results ifNil: [ results := OrderedCollection new ]
]

{ #category : #accessing }
SmockPickingResult >> results: anObject [

	results := anObject
]

{ #category : #accessing }
SmockPickingResult >> timestamp [

	^ timestamp
]

{ #category : #accessing }
SmockPickingResult >> timestamp: anObject [

	timestamp := anObject
]
