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

{ #category : #children }
SmockGCompositeShape2D >> getChild: anId [
	"Get a GShape2D on the shape list"

	anId ifNil: [ ^ nil ].
	^ self gShapeList detect: [ :e | e id = anId ] ifNone: [ nil ]
]

{ #category : #children }
SmockGCompositeShape2D >> hasChildren [

	^ self numberOfChildren > 0
]

{ #category : #children }
SmockGCompositeShape2D >> includesChild: aGShape [

	aGShape ifNil: [ ^ false ].
	^ self gShapeList includes: aGShape
]

{ #category : #testing }
SmockGCompositeShape2D >> isComposite [ 

	^ true
]

{ #category : #testing }
SmockGCompositeShape2D >> isDrawable [

	super isDrawable ifFalse:[ ^ false ].
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

{ #category : #children }
SmockGCompositeShape2D >> removeChild: aGShape [

	(self includesChild: aGShape) ifFalse: [ ^ self ].
	self gShapeList remove: aGShape
]

{ #category : #children }
SmockGCompositeShape2D >> removeChildren [

	self isEmpty ifTrue:[ ^ self ].
	self gShapeList copy do:[ :e | self removeChild: e ].
]

{ #category : #children }
SmockGCompositeShape2D >> sortChildrenBy: aSortBlock [

	aSortBlock ifNil:[ ^ self ].
	self gShapeList sort: aSortBlock
]
