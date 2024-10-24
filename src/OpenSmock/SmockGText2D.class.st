Class {
	#name : #SmockGText2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockAlignable',
	#classTraits : 'TSmockAlignable classTrait',
	#instVars : [
		'text',
		'smockFont',
		'glyphs',
		'needToComputeGlyphs'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #testing }
SmockGText2D >> isDrawable [ 

	super isDrawable ifFalse:[ ^ false ].
	self position ifNil: [ ^ false ].
	self text ifNil: [ ^ false ].
	self text ifEmpty:[ ^ false ].
	self smockFont ifNil: [ ^ false ].

	^ true
]

{ #category : #accessing }
SmockGText2D >> needToComputeGlyphs [

	^ needToComputeGlyphs ifNil: [ needToComputeGlyphs := true ]
]

{ #category : #accessing }
SmockGText2D >> needToComputeGlyphs: anObject [

	needToComputeGlyphs := anObject
]

{ #category : #accessing }
SmockGText2D >> smockFont [

	^ smockFont
]

{ #category : #accessing }
SmockGText2D >> smockFont: anObject [

	smockFont = anObject ifTrue: [ ^ self ].
	smockFont := anObject.
	self needToComputeGlyphs: true
]

{ #category : #accessing }
SmockGText2D >> text [

	^ text
]

{ #category : #accessing }
SmockGText2D >> text: anObject [

	text = anObject ifTrue: [ ^ self ].
	text := anObject.
	self needToComputeGlyphs: true
]
