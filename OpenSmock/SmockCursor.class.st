Class {
	#name : #SmockCursor,
	#superclass : #Object,
	#instVars : [
		'key',
		'coordinates',
		'event',
		'source'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockCursor >> coordinates [

	^ coordinates
]

{ #category : #accessing }
SmockCursor >> coordinates: anObject [

	coordinates := anObject
]

{ #category : #accessing }
SmockCursor >> event [

	^ event
]

{ #category : #accessing }
SmockCursor >> event: anObject [

	event := anObject
]

{ #category : #accessing }
SmockCursor >> key [

	^ key
]

{ #category : #accessing }
SmockCursor >> key: anObject [

	key := anObject
]

{ #category : #accessing }
SmockCursor >> source [

	^ source
]

{ #category : #accessing }
SmockCursor >> source: anObject [

	source := anObject
]
