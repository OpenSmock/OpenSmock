Class {
	#name : #SmockGCompositeShape2D,
	#superclass : #SmockGShape2D,
	#instVars : [
		'gShapeList'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #children }
SmockGCompositeShape2D >> addChild: aGShape [

	self gShapeList add: aGShape 
]

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList [

	^ gShapeList ifNil: [ gShapeList := OrderedCollection new ]
]

{ #category : #accessing }
SmockGCompositeShape2D >> gShapeList: anObject [

	gShapeList := anObject
]

{ #category : #testing }
SmockGCompositeShape2D >> isComposite [ 

	^ true
]

{ #category : #testing }
SmockGCompositeShape2D >> isDrawable [

	^ self isNotEmpty
]

{ #category : #testing }
SmockGCompositeShape2D >> isEmpty [

	^ self gShapeList isEmpty
]

{ #category : #testing }
SmockGCompositeShape2D >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #children }
SmockGCompositeShape2D >> numberOfChildren [

	^ self gShapeList size
]
