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

{ #category : #children }
SmockGCompositeShape2D >> addChildren: aGShapeList [

	aGShapeList do: [ :e | self addChild: e ]
]

{ #category : #testing }
SmockGCompositeShape2D >> containedInRect: aRectangle select: aSelectBlock [
	| relativeRectangle children |

	self hasChildren ifFalse:[ ^ false ].

	relativeRectangle := nil.

	"select children to test"
	children := self gShapeList select: aSelectBlock.
	
	^ children detect:[ :child | | rectangle |
		
		rectangle := child isTranslatedByParent 
			ifFalse:[ aRectangle ] 
			ifTrue:[ relativeRectangle ifNil:[ relativeRectangle := aRectangle translateBy: (self position negated) ]. relativeRectangle ].
		
		(child containedInRect: rectangle select: aSelectBlock) not
	] ifFound: [ false ] ifNone: [ true ]
]

{ #category : #comparing }
SmockGCompositeShape2D >> distanceTo: aPoint select: aSelectBlock [
	"Detect if the composite have children. Don't considere the exact position of the composite to return a distance, because it doesn't make sens to distance a composite without content"

	| distance |
	
	distance := SmallInteger maxVal.
	(aSelectBlock notNil and: [ aSelectBlock value: self ]) ifFalse: [
		^ distance ].
	self position ifNil:[ ^ distance ].

	"Scan children to detect the distance"
	self gShapeList do: [ :e |
			| childrenDistance point |
			point := e isTranslatedByParent
				         ifTrue: [ aPoint - self position ]
				         ifFalse: [ aPoint ].
			childrenDistance := e distanceTo: point select: aSelectBlock.
			childrenDistance = 0 ifTrue:[ ^ childrenDistance ].
			distance := distance min: childrenDistance. 
	].

	^ distance
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
SmockGCompositeShape2D >> intersects: aRectangle select: aSelectBlock [

	self hasChildren ifFalse:[ ^ false ].

	^ self gShapeList detect:[ :child |
		(child intersects: aRectangle select: aSelectBlock) not 
	] ifFound: [ false ] ifNone: [ true ]
]

{ #category : #testing }
SmockGCompositeShape2D >> isComposite [ 

	^ true
]

{ #category : #testing }
SmockGCompositeShape2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

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
