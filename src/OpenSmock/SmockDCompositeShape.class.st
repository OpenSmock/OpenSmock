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
		'hasDrawModeUserChildren'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #children }
SmockDCompositeShape >> addChild: aDShape [

	(self includesChild: aDShape) ifTrue: [ ^ self ].

	self updateModelWithChild: aDShape.
	self dShapeList add: aDShape
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
	copy dShapeList: (self dShapeList collect: [ :s | s copy ]).
	copy toUpdateDShapeList: (self toUpdateDShapeList collect: [ :s | s copy ]).
	copy toDeleteDShapeList: (self toDeleteDShapeList collect: [ :s | s copy ]).
	^ copy
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
SmockDCompositeShape >> getChild: aKey [
	"Get a DShape on the shape list"

	aKey ifNil: [ ^ nil ].
	^ self dShapeList detect: [ :e | e key = aKey ] ifNone: [ nil ]
]

{ #category : #testing }
SmockDCompositeShape >> hasDirtyChildren [

	self toUpdateDShapeList ifNotEmpty: [ ^ true ].
	self toDeleteDShapeList ifNotEmpty: [ ^ true ].
	
	^ false
]

{ #category : #accessing }
SmockDCompositeShape >> hasDrawModeUserChildren [

	^ hasDrawModeUserChildren ifNil: [ hasDrawModeUserChildren := false ]
]

{ #category : #accessing }
SmockDCompositeShape >> hasDrawModeUserChildren: aBoolean [

	hasDrawModeUserChildren := aBoolean
]

{ #category : #children }
SmockDCompositeShape >> includesChild: aDShape [

	aDShape ifNil:[^false].
	^self dShapeList includes: aDShape
]

{ #category : #children }
SmockDCompositeShape >> includesChildKey: aKey [

	^(self getChild: aKey) notNil
]

{ #category : #testing }
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
		 (self toDeleteDShapeList includes: aDShape) not ]) ifFalse: [
		^ self ].

	self dShapeList remove: aDShape.
	
	self toDeleteDShapeList add: aDShape
]

{ #category : #children }
SmockDCompositeShape >> removeChildren [

	self isEmpty ifTrue:[ ^ self ].
	self dShapeList copy do:[ :e | self removeChild: e ].
]

{ #category : #children }
SmockDCompositeShape >> sortChildrenBy: aSortBlock [

	aSortBlock ifNil:[ ^ self ].
	self dShapeList sort: aSortBlock
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
		 (self toUpdateDShapeList includes: aDShape) not ]) ifFalse: [
		^ self ].
	
	self toUpdateDShapeList add: aDShape
]

{ #category : #private }
SmockDCompositeShape >> updateModelWithChild: aDShape [
	"Update internal model with child update"

	aDShape isLeaf
		ifTrue: [
			aDShape isDrawModeUser ifTrue: [
				self hasDrawModeUserChildren: true ] ]
		ifFalse: [
			(aDShape isComposite and: [ aDShape hasDrawModeUserChildren ])
				ifTrue: [ self hasDrawModeUserChildren: true ] ]
]
