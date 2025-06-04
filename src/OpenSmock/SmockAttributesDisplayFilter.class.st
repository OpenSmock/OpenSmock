Class {
	#name : #SmockAttributesDisplayFilter,
	#superclass : #SmockDisplayFilter,
	#instVars : [
		'attributes',
		'attributesMasks'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockAttributesDisplayFilter class >> attributes: anArray [

	^ self new attributes: anArray
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> addAttribute: aSymbol [
	| list |

	(self attributes includes: aSymbol) ifTrue: [ ^ self ].

	list := OrderedCollection withAll: self attributes.
	list add: aSymbol.

	self attributes: list asArray.
	attributesMasks := nil.
]

{ #category : #accessing }
SmockAttributesDisplayFilter >> attributes [

	^ attributes ifNil:[ attributes := #() ]
]

{ #category : #accessing }
SmockAttributesDisplayFilter >> attributes: anObject [

	attributes ~= anObject ifTrue: [ attributesMasks := nil ].
	attributes := anObject
]

{ #category : #gShapes }
SmockAttributesDisplayFilter >> configureFromDShape: aDShape toGShape: aGShape2D [

	aDShape displayFilter ifNil:[ ^ self ].
	aGShape2D displayMask: (aDShape displayFilter ifNotNil: [ :f | self maskForAttributes: f attributes ]).
]

{ #category : #private }
SmockAttributesDisplayFilter >> initializeAttributesMasks [

	attributesMasks := Dictionary new.
	attributes ifNil:[ ^ self ].
	attributes do:[ :e | 
		attributesMasks at: e ifAbsentPut: [ 2 raisedTo: (attributesMasks size) ]
	].
]

{ #category : #testing }
SmockAttributesDisplayFilter >> isEmpty [

	^ self attributes isNil or: [ self attributes isEmpty ]
]

{ #category : #gShapes }
SmockAttributesDisplayFilter >> isGShapeFiltered: aGShape [

	aGShape ifNil: [ ^ true ].
	self isFilteringNothing ifTrue: [ ^ false ].
	aGShape displayMask ifNil: [ ^ true ].
	aGShape displayMask = 0 ifTrue: [ ^ true ]. "case when a layer filter is filtering and the dshape mask is empty"

	^ (aGShape displayMask bitAnd: self mask) ~= aGShape displayMask
]

{ #category : #mask }
SmockAttributesDisplayFilter >> mask [

	^ self maskForAttributes: self attributes
]

{ #category : #mask }
SmockAttributesDisplayFilter >> maskForAttribute: anAttribute [

	attributesMasks ifNil: [
		self initializeAttributesMasks ].

	^ attributesMasks at: anAttribute ifAbsent: [ 0 ]
]

{ #category : #mask }
SmockAttributesDisplayFilter >> maskForAttributes: anArray [

	| mask |	
	mask := 0.
	anArray do: [ :e |
		(self maskForAttribute: e) ifNotNil: [ :f | mask := mask + f ] ].

	^ mask
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> removeAttribute: aSymbol [
	| list |

	(self attributes includes: aSymbol) ifFalse: [ ^ self ].

	list := OrderedCollection withAll: self attributes.
	list remove: aSymbol.

	self attributes: list asArray.
	attributesMasks := nil.
]
