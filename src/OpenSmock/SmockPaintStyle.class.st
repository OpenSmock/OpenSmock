Class {
	#name : #SmockPaintStyle,
	#superclass : #Object,
	#instVars : [
		'paint'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockPaintStyle class >> isAbstract [

	^ self == SmockPaintStyle
]

{ #category : #testing }
SmockPaintStyle >> = aPaintStyle [

	self class = aPaintStyle class ifFalse:[ ^ false ].
	self paint = aPaintStyle paint ifTrue: [ ^ true ].

	^ super = aPaintStyle
]

{ #category : #copying }
SmockPaintStyle >> copy [

	| copy |
	copy := self class new.
	copy paint: self paint copy.
	^ copy
]

{ #category : #testing }
SmockPaintStyle >> isColor [

	self paint ifNil:[ ^ false ].
	^ self paint isColor
]

{ #category : #testing }
SmockPaintStyle >> isGradient [

	self isColor ifTrue: [ ^ false ].
	^ self paint ifNotNil: [ :e | e isGradient ] ifNil: [ false ]
]

{ #category : #testing }
SmockPaintStyle >> isTransparent [

	self paint ifNil: [ ^ true ].
	self isColor ifTrue: [ ^ self paint isTransparent ].
	
	^ false
]

{ #category : #accessing }
SmockPaintStyle >> paint [

	^ paint
]

{ #category : #accessing }
SmockPaintStyle >> paint: anObject [

	paint := anObject
]
