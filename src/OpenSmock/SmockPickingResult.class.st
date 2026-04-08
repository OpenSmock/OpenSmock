Class {
	#name : #SmockPickingResult,
	#superclass : #Object,
	#instVars : [
		'timestamp',
		'results',
		'pickingDistanceBlock',
		'pickableGShapeBlock'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #testing }
SmockPickingResult class >> isAbstract [ 

	^ self == SmockPickingResult 
]

{ #category : #API }
SmockPickingResult >> addPickedElement: aPickingElement [

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

{ #category : #accessing }
SmockPickingResult >> defaultPickableGShapeBlock [

  ^ [ :gShape | gShape isPickable and: [ gShape isDrawable ] ]
]

{ #category : #accessing }
SmockPickingResult >> defaultPickingDistanceBlock [

	^ [ :gShape :point |
		  gShape
			  distanceTo: point
			  select: self pickableGShapeBlock ]
]

{ #category : #testing }
SmockPickingResult >> firstElement [

	self isEmpty ifTrue: [ ^ nil ].
	^ self results first
]

{ #category : #API }
SmockPickingResult >> getObjectIndexes [

	^ self results collect: [ :e | e objectIndex ]
]

{ #category : #API }
SmockPickingResult >> getObjects [

	^ self results collect: [ :e | e object ]
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
SmockPickingResult >> isPointPicking [

	^ false
]

{ #category : #testing }
SmockPickingResult >> isShapePicking [

	^ false
]

{ #category : #testing }
SmockPickingResult >> lastElement [

	self isEmpty ifTrue: [ ^ nil ].
	^ self results last
]

{ #category : #accessing }
SmockPickingResult >> pickableGShapeBlock [

	^ pickableGShapeBlock ifNil: [
		  pickableGShapeBlock := self defaultPickableGShapeBlock ]
]

{ #category : #accessing }
SmockPickingResult >> pickableGShapeBlock: aBlockClosure [

	pickableGShapeBlock := aBlockClosure
]

{ #category : #accessing }
SmockPickingResult >> pickingDistanceBlock [

	^ pickingDistanceBlock ifNil: [
		  pickingDistanceBlock := self defaultPickingDistanceBlock ]
]

{ #category : #accessing }
SmockPickingResult >> pickingDistanceBlock: aBlockClosure [

	pickingDistanceBlock := aBlockClosure
]

{ #category : #printing }
SmockPickingResult >> printString [

	| ws |
	ws := WriteStream on: String new.
	ws nextPutAll: 'Picking result:'.
	
	ws space.
	ws nextPutAll: self results size printString.
	ws nextPutAll: ' element(s).'.
	
	^ ws contents
]

{ #category : #API }
SmockPickingResult >> removePickedElement: aPickingElement [

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
