"
SmockAllowedAttributesDisplayFilter class
    
    This class is responsible for filtering and managing the display 
    of allowed attributes within an user interface. It enables the 
    definition of which attributes should be visible in the user interface, 
    thereby enhancing the clarity and relevance of the information presented 
    to the user.
    
    By utilizing this class, developers can apply filtering rules to 
    display only the pertinent attributes, ensuring an optimized user 
    experience while adhering to the current access configurations.
"
Class {
	#name : #SmockAttributesDisplayFilter,
	#superclass : #SmockDisplayFilter,
	#instVars : [
		'allowedAttributes',
		'attributesMasks',
		'displayObjectsWithoutAttributes',
		'attributeList'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockAttributesDisplayFilter class >> fromAttributeList: aSmockDisplayFilterAttributeList [

	^ self new attributeList: aSmockDisplayFilterAttributeList
]

{ #category : #'instance creation' }
SmockAttributesDisplayFilter class >> fromObjects: anObjectList [

	^ self fromAttributeList:
		  (SmockAttributeList fromObjects: anObjectList)
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> allowAllAttributes [

	allowedAttributes := nil
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> allowAttribute: aSymbol [

	(attributeList hasAttribute: aSymbol) ifFalse: [ ^ self ].

	self allowedAttributes add: aSymbol
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> allowAttributes: aList [

	aList do: [ :e | self allowAttribute: e ]
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> allowedAttributes [

	^ allowedAttributes ifNil:[ allowedAttributes := Set withAll: attributeList attributes ]
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> attributeList: aSmockDisplayFilterAttributeList [

	(aSmockDisplayFilterAttributeList isKindOf: SmockAttributeList)
		ifFalse: [ SmockNotSupportedDataError signal: 'Not a SmockAttributeList instance.'. ^ self ].

	attributeList ~= aSmockDisplayFilterAttributeList ifTrue: [
		self reset ].

	attributeList := aSmockDisplayFilterAttributeList
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> attributes [

	^ attributeList attributes copy
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> disallowAllAttributes [

	self allowedAttributes removeAll
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> disallowAttribute: aSymbol [

	((attributeList hasAttribute: aSymbol) and:[self allowedAttributes includes: aSymbol]) ifFalse: [ ^ self ].

	self allowedAttributes remove: aSymbol
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> disallowAttributes: aList [

	aList do: [ :e | self disallowAttribute: e ]
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> displayObjectsWithoutAttributes [

	^ displayObjectsWithoutAttributes ifNil:[ displayObjectsWithoutAttributes := true ]
]

{ #category : #attributes }
SmockAttributesDisplayFilter >> displayObjectsWithoutAttributes: aBoolean [

	displayObjectsWithoutAttributes := aBoolean
]

{ #category : #initialization }
SmockAttributesDisplayFilter >> initialize [

	super initialize.
	self initializeAttributeList
]

{ #category : #initialization }
SmockAttributesDisplayFilter >> initializeAttributeList [

	attributeList := SmockAttributeList new
]

{ #category : #private }
SmockAttributesDisplayFilter >> initializeAttributesMasks [

	attributesMasks := Dictionary new.
	attributeList attributes do:[ :e | 
		attributesMasks at: e ifAbsentPut: [ 2 raisedTo: (attributesMasks size) ]
	].
]

{ #category : #testing }
SmockAttributesDisplayFilter >> isDisplayNothing [

	^ attributeList nbAttributes = 0 or: [
		  self allowedAttributes isEmpty ]
]

{ #category : #gShapes }
SmockAttributesDisplayFilter >> isGShapeDisplayed: aGShape [

	| gShapeMask |
	aGShape ifNil: [ ^ false ]. "cannot display not supported objects"
	self isDisplayNothing ifTrue: [ ^ false ].
	
	gShapeMask := aGShape displayMask.
	gShapeMask ifNil: [ ^ self displayObjectsWithoutAttributes ]. "display gShape without mask only on displayObjectsWithoutAttributes setting" 
	(gShapeMask = 0) ifTrue: [ ^ false ]. "case when a layer filter is filtering and the dshape mask is empty"

	^ (gShapeMask bitAnd: (self maskForAttributes: self allowedAttributes )) = gShapeMask
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

{ #category : #gShapes }
SmockAttributesDisplayFilter >> processDShape: aDShape toGShape: aGShape2D [

	
	aGShape2D displayMask: (aDShape displayFilter ifNotNil: [ :f | self maskForAttributes: f attributes ] ).
]

{ #category : #private }
SmockAttributesDisplayFilter >> reset [

	attributesMasks := nil.
	allowedAttributes := nil
]
