Class {
	#name : #SmockGCompositeShape2D,
	#superclass : #SmockGShape2D,
	#instVars : [
		'gShapeList'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList [

	^ gShapeList
]

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList: anObject [

	gShapeList := anObject
]
