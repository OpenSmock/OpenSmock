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

{ #category : #accessing }
SmockGLeafShape2D >> strokeStyle [

	^ strokeStyle
]

{ #category : #accessing }
SmockGLeafShape2D >> strokeStyle: anObject [

	strokeStyle := anObject
]
