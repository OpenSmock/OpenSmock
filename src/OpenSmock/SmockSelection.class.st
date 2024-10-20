Class {
	#name : #SmockSelection,
	#superclass : #Object,
	#instVars : [
		'keys',
		'origin',
		'dateTime'
	],
	#category : #'OpenSmock-SelectionManager'
}

{ #category : #constructor }
SmockSelection class >> keys: aCollection [
	"create a selection from a list of keys"
	
	^ self new setKeys: aCollection 
]

{ #category : #accessing }
SmockSelection >> dateTime [

	^ dateTime
]

{ #category : #accessing }
SmockSelection >> dateTime: anObject [

	dateTime := anObject
]

{ #category : #testing }
SmockSelection >> initialize [ 

	super initialize.
	self dateTime: DateAndTime now.
]

{ #category : #testing }
SmockSelection >> isEmpty [

	^ self keys isEmpty
]

{ #category : #accessing }
SmockSelection >> keys [

	^ keys ifNil:[ keys := OrderedCollection new ].
]

{ #category : #accessing }
SmockSelection >> keys: aCollection [

	keys := aCollection
]

{ #category : #querying }
SmockSelection >> nbKeys [

	^ self keys size
]

{ #category : #accessing }
SmockSelection >> origin [

	^ origin
]

{ #category : #accessing }
SmockSelection >> origin: anObject [

	origin := anObject
]

{ #category : #keys }
SmockSelection >> setKeys: aCollection [

	self keys addAll: aCollection
]
