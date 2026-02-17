Class {
	#name : #SmockGLeafShape2D,
	#superclass : #SmockGShape2D,
	#traits : 'TSmockHavePaintStyles',
	#classTraits : 'TSmockHavePaintStyles classTrait',
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGLeafShape2D class >> isAbstract [ 

	^ self = SmockGLeafShape2D 
]

{ #category : #testing }
SmockGLeafShape2D >> isDrawable [

	super isDrawable ifFalse: [ ^ false ].

	^ self isTransparent not
]

{ #category : #testing }
SmockGLeafShape2D >> isLeaf [

	^ true
]
