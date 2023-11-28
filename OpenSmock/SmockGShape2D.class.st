Class {
	#name : #SmockGShape2D,
	#superclass : #Object,
	#instVars : [
		'id',
		'isVisible',
		'position'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGShape2D >> id [

	^ id
]

{ #category : #accessing }
SmockGShape2D >> id: anObject [

	id := anObject
]

{ #category : #accessing }
SmockGShape2D >> isVisible [

	^ isVisible ifNil:[ isVisible := true ].
]

{ #category : #accessing }
SmockGShape2D >> isVisible: anObject [

	isVisible := anObject
]

{ #category : #accessing }
SmockGShape2D >> position [

	^ position
]

{ #category : #accessing }
SmockGShape2D >> position: anObject [

	position := anObject
]
