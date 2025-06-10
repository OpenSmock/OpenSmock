"
I'm an object which manage a list of attributes (i.e. symbols).
I'm used to setup AttributesDisplayFilter.
"
Class {
	#name : #SmockAttributeList,
	#superclass : #Object,
	#instVars : [
		'attributes'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockAttributeList class >> fromObject: anObject [

	| object |
	object := self new.
	object addAttribute: anObject.
	^ object
]

{ #category : #accessing }
SmockAttributeList class >> fromObjects: anObjectList [

	| object |
	object := self new.
	object addAllAttributes: anObjectList.
	^ object
]

{ #category : #'attributes - list' }
SmockAttributeList >> addAllAttributes: aSymbolList [

	attributes addAll: aSymbolList
]

{ #category : #'attributes - list' }
SmockAttributeList >> addAttribute: aSymbol [

	attributes add: aSymbol
]

{ #category : #'attributes - list' }
SmockAttributeList >> attributes [

	^ attributes
]

{ #category : #'attributes - list' }
SmockAttributeList >> hasAttribute: aSymbol [

	^ attributes includes: aSymbol
]

{ #category : #initialization }
SmockAttributeList >> initialize [

	super initialize.
	self initializeAttributes.
]

{ #category : #initialization }
SmockAttributeList >> initializeAttributes [

	attributes := Set new
]

{ #category : #'attributes - list' }
SmockAttributeList >> nbAttributes [

	^ attributes size
]

{ #category : #'attributes - list' }
SmockAttributeList >> removeAttribute: aSymbol [

	attributes remove: aSymbol
]
