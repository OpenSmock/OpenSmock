"
I am a Display Composite Shape.
I manage a group of DShape to compose the view like a Tree Model.
"
Class {
	#name : #SmockDCompositeShape,
	#superclass : #SmockDShape,
	#instVars : [
		'dShapeList',
		'toUpdateDShapeList',
		'toDeleteDShapeList',
		'hasUserDrawMode'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #children }
SmockDCompositeShape >> addChild: aDShape [

	(self includesChild: aDShape) ifFalse: [
		self flag:
			'PLA : provisoire, lorsque la ou les DShape filles changent de mode de dessin la variable nest pas encore mise a jour'.
		aDShape isLeaf
			ifTrue: [
			aDShape isDrawModeUser ifTrue: [ self hasUserDrawMode: true ] ]
			ifFalse: [
				(aDShape isComposite and: [ aDShape hasUserDrawMode ])
					ifTrue: [ self hasUserDrawMode: true ] ].
		self dShapeList add: aDShape ]
]

{ #category : #children }
SmockDCompositeShape >> addDShape: aDShape [
	
	self deprecated: 'use children API' transformWith: 
	'`@receiver addDShape: `@aDShape' -> '`@receiver addChild: `@aDShape'.
	
	self addChild: aDShape
]

{ #category : #'children - updating' }
SmockDCompositeShape >> clearToDeleteDShapeList [

	self toDeleteDShapeList removeAll
]

{ #category : #'children - updating' }
SmockDCompositeShape >> clearToUpdateDShapeList [

	self toUpdateDShapeList removeAll
]

{ #category : #copying }
SmockDCompositeShape >> copy [
	| copy |
	copy := super copy.
	copy dShapeList: (self dShapeList collect:[ :s | s copy]).
	copy toUpdateDShapeList: (self toUpdateDShapeList collect:[ :s | s copy]).
	copy toDeleteDShapeList: (self toDeleteDShapeList collect:[ :s | s copy]).
	^copy
]

{ #category : #accessing }
SmockDCompositeShape >> dShapeList [

	^ dShapeList ifNil: [ dShapeList := OrderedCollection new ]
]

{ #category : #accessing }
SmockDCompositeShape >> dShapeList: anObject [

	dShapeList := anObject
]

{ #category : #children }
SmockDCompositeShape >> deleteDShape: aDShape [

	self deprecated: 'use children API' transformWith: 
	'`@receiver deleteDShape: `@aDShape' -> '`@receiver removeChild: `@aDShape'.
	
	self removeChild: aDShape
]

{ #category : #children }
SmockDCompositeShape >> getChild: aKey [

	"Get a DShape on the shape list"
	aKey ifNil:[^nil].
	^self dShapeList detect:[ :d | d key = aKey ] ifNone:[nil]
]

{ #category : #children }
SmockDCompositeShape >> getDShape: aKey [
	
	self deprecated: 'use children API' transformWith: 
	'`@receiver getDShape: `@aKey' -> '`@receiver getChild: `@aKey'.
	
	^ self getChild: aKey
]

{ #category : #accessing }
SmockDCompositeShape >> hasUserDrawMode [

	^ hasUserDrawMode ifNil: [ hasUserDrawMode := false ]
]

{ #category : #accessing }
SmockDCompositeShape >> hasUserDrawMode: aBoolean [

	hasUserDrawMode := aBoolean
]

{ #category : #children }
SmockDCompositeShape >> includesChild: aDShape [

	aDShape ifNil:[^false].
	^self dShapeList includes: aDShape
]

{ #category : #children }
SmockDCompositeShape >> includesChildKey: aKey [

	^(self getDShape: aKey) notNil
]

{ #category : #children }
SmockDCompositeShape >> includesDShape: aDShape [
	
	self deprecated: 'use children API' transformWith: 
	'`@receiver includesDShape: `@aDShape' -> '`@receiver includesChild: `@aDShape'.
	
	^ self includesChild: aDShape
]

{ #category : #children }
SmockDCompositeShape >> includesDShapeKey: aKey [
	
	self deprecated: 'use children API' transformWith: 
	'`@receiver includesDShapeKey: `@aKey' -> '`@receiver includesChildKey: `@aKey'.
	
	^ self includesChildKey: aKey
]

{ #category : #'initialize-release' }
SmockDCompositeShape >> initialize [
	super initialize.
]

{ #category : #accessing }
SmockDCompositeShape >> isComposite [

	^ true
]

{ #category : #testing }
SmockDCompositeShape >> isEmpty [

	^ self dShapeList isEmpty
]

{ #category : #testing }
SmockDCompositeShape >> isNotEmpty [

	^ self isEmpty not
]

{ #category : #children }
SmockDCompositeShape >> numberOfChildren [

	^ self dShapeList size
]

{ #category : #children }
SmockDCompositeShape >> removeChild: aDShape [

	((self includesChild: aDShape) and: [
		 (self toDeleteDShapeList includes: aDShape) not ]) ifTrue: [
		self toDeleteDShapeList add: aDShape ]
]

{ #category : #'children - updating' }
SmockDCompositeShape >> toDeleteDShapeList [

	^ toDeleteDShapeList ifNil: [
		  toDeleteDShapeList := OrderedCollection new ]
]

{ #category : #'children - updating' }
SmockDCompositeShape >> toDeleteDShapeList: anObject [

	toDeleteDShapeList := anObject
]

{ #category : #'children - updating' }
SmockDCompositeShape >> toUpdateDShapeList [

	^ toUpdateDShapeList ifNil: [
		  toUpdateDShapeList := OrderedCollection new ]
]

{ #category : #'children - updating' }
SmockDCompositeShape >> toUpdateDShapeList: anObject [

	toUpdateDShapeList := anObject
]

{ #category : #children }
SmockDCompositeShape >> updateChild: aDShape [

	((self includesChild: aDShape) and: [
		 (self toUpdateDShapeList includes: aDShape) not ]) ifTrue: [
		self toUpdateDShapeList add: aDShape ]
]

{ #category : #children }
SmockDCompositeShape >> updateDShape: aDShape [
	
	self deprecated: 'use children API' transformWith: 
	'`@receiver updateDShape: `@aDShape' -> '`@receiver updateChild: `@aDShape'.
	
	self updateChild: aDShape
]
