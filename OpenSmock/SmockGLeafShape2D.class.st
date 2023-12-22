Class {
	#name : #SmockGLeafShape2D,
	#superclass : #SmockGShape2D,
	#instVars : [
		'fillStyle',
		'strokeStyle'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGLeafShape2D class >> isAbstract [ 

	^ self = SmockGLeafShape2D 
]

{ #category : #accessing }
SmockGLeafShape2D >> fillStyle [

	^ fillStyle
]

{ #category : #accessing }
SmockGLeafShape2D >> fillStyle: anObject [

	fillStyle := anObject
]

{ #category : #testing }
SmockGLeafShape2D >> isDrawable [

	^ self isTransparent not
]

{ #category : #testing }
SmockGLeafShape2D >> isTransparent [

	(self fillStyle isNil and: [ self strokeStyle isNil ]) ifTrue:[ ^ true ].
	
	self fillStyle ifNotNil:[ :e | e isTransparent ifTrue:[ ^ true ] ].
	self strokeStyle ifNotNil:[ :e | e isTransparent ifTrue:[ ^ true ] ].
	
	^ false
]

{ #category : #accessing }
SmockGLeafShape2D >> strokeStyle [

	^ strokeStyle
]

{ #category : #accessing }
SmockGLeafShape2D >> strokeStyle: anObject [

	strokeStyle := anObject
]
