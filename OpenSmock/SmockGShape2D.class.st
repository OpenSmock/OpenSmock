Class {
	#name : #SmockGShape2D,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties',
	#classTraits : 'TSmockHaveProperties classTrait',
	#instVars : [
		'id',
		'isVisible',
		'position',
		'buffer',
		'buffered',
		'dirty'
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

	^ true
]

{ #category : #accessing }
SmockGShape2D >> buffer [

	^ buffer
]

{ #category : #accessing }
SmockGShape2D >> buffer: anObject [

	buffer := anObject
]

{ #category : #copying }
SmockGShape2D >> copy [

	| copy |
	copy := self class new.
	copy id: self id copy.
	copy isVisible: self isVisible.
	copy position: self position copy.
	^ copy
]

{ #category : #comparing }
SmockGShape2D >> distanceTo: aPoint [

	^ self position ifNotNil:[ :e | e distanceTo: aPoint ]
]

{ #category : #accessing }
SmockGShape2D >> id [

	^ id
]

{ #category : #accessing }
SmockGShape2D >> id: anObject [

	id := anObject
]

{ #category : #accessing }
SmockGShape2D >> isBuffered [

	^ buffered ifNil: [ buffered := false ]
]

{ #category : #testing }
SmockGShape2D >> isComposite [

	^ false
]

{ #category : #testing }
SmockGShape2D >> isDrawable [

	^ false
]

{ #category : #testing }
SmockGShape2D >> isLeaf [

	^ false
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
