Class {
	#name : #SmockGShape2D,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties',
	#classTraits : 'TSmockHaveProperties classTrait',
	#instVars : [
		'id',
		'isVisible',
		'isTranslatedByParent',
		'position',
		'displayMask',
		'zIndex'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGShape2D class >> id: anId [

	| gShape |
	gShape := self new.
	gShape id: anId.
	^ gShape
]

{ #category : #testing }
SmockGShape2D class >> isAbstract [ 

	^ self = SmockGShape2D 
]

{ #category : #comparing }
SmockGShape2D >> = aGShape [
	"compare each values of the GShape"

	self id ~= aGShape id ifTrue: [ ^ false ].
	self position ~= aGShape position ifTrue: [ ^ false ].
	self isVisible ~= aGShape isVisible ifTrue: [ ^ false ].
	self displayMask ~= aGShape displayMask ifTrue: [ ^ false ].
	self isTranslatedByParent ~= aGShape isTranslatedByParent ifTrue:[ ^ false ].
	self zIndex ~= aGShape zIndex ifTrue:[ ^ false ].

	^ true
]

{ #category : #copying }
SmockGShape2D >> copy [

	| copy |
	copy := self class new.
	copy id: self id copy.
	copy isVisible: self isVisible.
	copy position: self position copy.
	copy isTranslatedByParent: self isTranslatedByParent.
	copy displayMask: self displayMask copy.
	copy zIndex: self zIndex.

	^ copy
]

{ #category : #accessing }
SmockGShape2D >> displayMask [

	^ displayMask
]

{ #category : #accessing }
SmockGShape2D >> displayMask: anObject [

	displayMask := anObject
]

{ #category : #comparing }
SmockGShape2D >> distanceTo: aPoint [

	^ self position
		  ifNotNil: [ :e | e distanceTo: aPoint ]
		  ifNil: [ SmallInteger maxVal ]
]

{ #category : #accessing }
SmockGShape2D >> id [

	^ id
]

{ #category : #accessing }
SmockGShape2D >> id: anObject [

	id := anObject
]

{ #category : #testing }
SmockGShape2D >> isComposite [

	^ false
]

{ #category : #testing }
SmockGShape2D >> isDrawable [

	^ self isVisible
]

{ #category : #testing }
SmockGShape2D >> isLeaf [

	^ false
]

{ #category : #accessing }
SmockGShape2D >> isTranslatedByParent [

	^ isTranslatedByParent ifNil:[ isTranslatedByParent := true ]
]

{ #category : #accessing }
SmockGShape2D >> isTranslatedByParent: anObject [

	isTranslatedByParent := anObject
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

{ #category : #printing }
SmockGShape2D >> printOn: aStream [

	super printOn: aStream.
	self id ifNotNil: [ :e |
		aStream space.
		aStream nextPutAll: e printString ].

	self isVisible ifTrue: [ ^ self ].
	aStream space.
	aStream nextPutAll: '(not visible)'
]

{ #category : #accessing }
SmockGShape2D >> zIndex [

	^ zIndex ifNil:[ zIndex := 0 ]
]

{ #category : #accessing }
SmockGShape2D >> zIndex: anInteger [

	zIndex := anInteger
]
