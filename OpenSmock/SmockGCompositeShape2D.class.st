Class {
	#name : #SmockGCompositeShape2D,
	#superclass : #SmockGShape2D,
	#instVars : [
		'gShapeList'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #drawing }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	self flag:'labordep: draw children'.
]

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList [

	^ gShapeList
]

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList: anObject [

	gShapeList := anObject
]
