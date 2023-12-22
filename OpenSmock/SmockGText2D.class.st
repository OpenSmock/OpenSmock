Class {
	#name : #SmockGText2D,
	#superclass : #SmockGLeafShape2D,
	#traits : 'TSmockGPositionnable',
	#classTraits : 'TSmockGPositionnable classTrait',
	#instVars : [
		'text',
		'smockFont',
		'glyphs'
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
SmockGText2D >> smockFont [

	^ smockFont
]

{ #category : #accessing }
SmockGText2D >> smockFont: anObject [


	smockFont := anObject.
		self updatedFontOrText
]

{ #category : #accessing }
SmockGText2D >> text [

	^ text
]

{ #category : #accessing }
SmockGText2D >> text: anObject [

	text := anObject.
	self updatedFontOrText.
]

{ #category : #accessing }
SmockGText2D >> updatedFontOrText [
"glyphs has to be computed"
	glyphs := nil
]
