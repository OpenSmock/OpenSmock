Class {
	#name : #SmockPaintStyle,
	#superclass : #Object,
	#instVars : [
		'paint'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockPaintStyle >> isColor [

	self paint ifNil:[ ^ false ].
	^ self paint isColor
]

{ #category : #accessing }
SmockPaintStyle >> paint [

	^ paint
]

{ #category : #accessing }
SmockPaintStyle >> paint: anObject [

	paint := anObject
]
