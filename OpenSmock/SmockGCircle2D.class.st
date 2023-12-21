Class {
	#name : #SmockGCircle2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radius'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
SmockGCircle2D >> radius [

	^ radius
]

{ #category : #accessing }
SmockGCircle2D >> radius: anObject [

	radius := anObject
]
