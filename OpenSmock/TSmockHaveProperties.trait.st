Trait {
	#name : #TSmockHaveProperties,
	#instVars : [
		'properties'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #properties }
TSmockHaveProperties >> getProperty: aSymbol [

	^ self properties at: aSymbol ifAbsent: [ ]
]

{ #category : #properties }
TSmockHaveProperties >> getProperty: aSymbol ifAbsentPut: aValue [

	^ self properties at: aSymbol ifAbsentPut: aValue
]

{ #category : #properties }
TSmockHaveProperties >> isPropertiesEmpty [

	^ properties isNil or: [ self properties isEmpty ]
]

{ #category : #properties }
TSmockHaveProperties >> isPropertyExists: aKey [

	^ self properties includesKey: aKey
]

{ #category : #properties }
TSmockHaveProperties >> properties [

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #properties }
TSmockHaveProperties >> properties: anObject [

	properties := anObject
]

{ #category : #properties }
TSmockHaveProperties >> removeProperty: aKey [

	self properties removeKey: aKey ifAbsent: [ ]
]

{ #category : #properties }
TSmockHaveProperties >> setProperty: aSymbol value: aValue [

	self properties at: aSymbol put: aValue
]
