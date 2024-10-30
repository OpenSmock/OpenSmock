Class {
	#name : #SmockGSector2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radius',
		'fromInDegrees',
		'toInDegrees'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGSector2D >> from [

	^ fromInDegrees
]

{ #category : #accessing }
SmockGSector2D >> from: anObject [

	fromInDegrees := anObject
]

{ #category : #accessing }
SmockGSector2D >> fromInDegrees [

	^ self from
]

{ #category : #accessing }
SmockGSector2D >> fromInDegrees: anObject [

	self from: anObject 
]

{ #category : #testing }
SmockGSector2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].
	self position ifNil: [ ^ false ].
	self from ifNil: [ ^ false ].
	self to ifNil: [ ^ false ].
	self radius ifNil: [ ^ false ].
	self radius = 0 ifTrue:[ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGSector2D >> radius [

	^ radius
]

{ #category : #accessing }
SmockGSector2D >> radius: anObject [

	radius := anObject
]

{ #category : #accessing }
SmockGSector2D >> to [

	^ toInDegrees
]

{ #category : #accessing }
SmockGSector2D >> to: anObject [

	toInDegrees := anObject
]

{ #category : #accessing }
SmockGSector2D >> toInDegrees [

	^ self to
]

{ #category : #accessing }
SmockGSector2D >> toInDegrees: anObject [

	self to: anObject
]
