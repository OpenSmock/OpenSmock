Class {
	#name : #SmockGEllipse2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockRotatable',
	#classTraits : 'TSmockRotatable classTrait',
	#instVars : [
		'radius1',
		'radius2'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGEllipse2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].
	
	self position ifNil: [ ^ false ].
	self radius1 ifNil: [ ^ false ].
	self radius1 = 0 ifTrue: [ ^ false ].
	self radius2 ifNil: [ ^ false ].
	self radius2 = 0 ifTrue: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGEllipse2D >> orientation [

	self
		deprecated: 'Use rotation'
		transformWith: '`@receiver orientation' -> '`@receiver rotation'.
		
	^ self rotation
]

{ #category : #accessing }
SmockGEllipse2D >> orientation: anObject [

	self
		deprecated: 'Use rotation'
		transformWith: '`@receiver orientation: `@anObject' -> '`@receiver rotation: `@anObject'.

	self rotation: anObject
]

{ #category : #accessing }
SmockGEllipse2D >> orientationInDegrees [

	self
		deprecated: 'Use rotationInDegrees'
		transformWith: '`@receiver orientationInDegrees' -> '`@receiver rotationInDegrees'.

	^ self rotationInDegrees 
]

{ #category : #accessing }
SmockGEllipse2D >> orientationInDegrees: anObject [

	self
		deprecated: 'Use rotation'
		transformWith: '`@receiver orientationInDegrees: `@anObject' -> '`@receiver rotationInDegrees: `@anObject'.

	self rotationInDegrees: anObject
]

{ #category : #accessing }
SmockGEllipse2D >> radius1 [

	^ radius1
]

{ #category : #accessing }
SmockGEllipse2D >> radius1: anObject [

	radius1 := anObject
]

{ #category : #accessing }
SmockGEllipse2D >> radius2 [

	^ radius2
]

{ #category : #accessing }
SmockGEllipse2D >> radius2: anObject [

	radius2 := anObject
]
