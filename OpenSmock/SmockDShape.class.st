"
I am a root DisplayShape.
I am used to convert a geographical coordinate data to a user coordinates graphic data.
"
Class {
	#name : #SmockDShape,
	#superclass : #Object,
	#traits : 'TSmockHaveProperties',
	#classTraits : 'TSmockHaveProperties classTrait',
	#instVars : [
		'key',
		'coordinates',
		'isVisible',
		'isTranslatedByParent',
		'drawMode',
		'displayMask',
		'displayOffset',
		'zIndex'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #accessing }
SmockDShape class >> key: aKey [

	| dShape |
	dShape := self new.
	dShape key: aKey.
	^ dShape
]

{ #category : #comparing }
SmockDShape >> = aDShape [
	"compare each values of the DShape"

	self key ~= aDShape key ifTrue: [ ^ false ].
	self coordinates ~= aDShape coordinates ifTrue: [ ^ false ].
	self isVisible ~= aDShape isVisible ifTrue: [ ^ false ].
	self displayMask ~= aDShape displayMask ifTrue: [ ^ false ].
	self displayOffset ~= aDShape displayOffset ifTrue: [ ^ false ].
	self isTranslatedByParent ~= aDShape isTranslatedByParent ifTrue:[ ^ false ].
	self isSelected ~= aDShape isSelected ifTrue:[ ^ false ].
	self zIndex ~= aDShape zIndex ifTrue:[ ^ false ].

	^ true
]

{ #category : #accessing }
SmockDShape >> coordinates [
	^ coordinates
]

{ #category : #accessing }
SmockDShape >> coordinates: anObject [
	coordinates := anObject
]

{ #category : #copying }
SmockDShape >> copy [

	| copy |
	copy := self class new.
	copy key: self key copy.
	copy coordinates: self coordinates copy.
	copy isVisible: self isVisible.
	copy displayMask: self displayMask copy.
	copy displayOffset: self displayOffset copy.
	copy isTranslatedByParent: self isTranslatedByParent.
	
	copy zIndex: self zIndex.
	^ copy
]

{ #category : #accessing }
SmockDShape >> displayMask [
	^ displayMask
]

{ #category : #accessing }
SmockDShape >> displayMask: anObject [
	displayMask := anObject
]

{ #category : #accessing }
SmockDShape >> displayOffset [
	^ displayOffset
]

{ #category : #accessing }
SmockDShape >> displayOffset: anObject [
	displayOffset := anObject
]

{ #category : #'initialize-release' }
SmockDShape >> initialize [
	super initialize.
]

{ #category : #accessing }
SmockDShape >> isComposite [

	^ false
]

{ #category : #accessing }
SmockDShape >> isLeaf [

	^ false
]

{ #category : #selection }
SmockDShape >> isSelected [

	^ (self getProperty: #selected) = true
]

{ #category : #selection }
SmockDShape >> isSelected: aBoolean [

	self setProperty: #selected value: aBoolean 
]

{ #category : #accessing }
SmockDShape >> isTranslatedByParent [

	^ isTranslatedByParent ifNil:[ isTranslatedByParent := true ]
]

{ #category : #accessing }
SmockDShape >> isTranslatedByParent: anObject [

	isTranslatedByParent := anObject
]

{ #category : #accessing }
SmockDShape >> isVisible [
	isVisible ifNil:[isVisible := true].
	^ isVisible
]

{ #category : #accessing }
SmockDShape >> isVisible: anObject [
	isVisible := anObject
]

{ #category : #accessing }
SmockDShape >> key [
	^ key
]

{ #category : #accessing }
SmockDShape >> key: anObject [
	key := anObject
]

{ #category : #accessing }
SmockDShape >> zIndex [

	^ zIndex ifNil:[ zIndex := 0 ]
]

{ #category : #accessing }
SmockDShape >> zIndex: anInteger [

	zIndex := anInteger
]
