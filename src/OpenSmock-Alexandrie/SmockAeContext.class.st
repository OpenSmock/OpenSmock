Class {
	#name : #SmockAeContext,
	#superclass : #SmockGraphicContext,
	#instVars : [
		'glyphs',
		'glyphBounds',
		'cairoScaledFont',
		'needToComputeGlyphBounds'
	],
	#category : #'OpenSmock-Alexandrie'
}

{ #category : #accessing }
SmockAeContext >> cairoScaledFont [

	^ cairoScaledFont
]

{ #category : #accessing }
SmockAeContext >> cairoScaledFont: anObject [

	cairoScaledFont := anObject
]

{ #category : #accessing }
SmockAeContext >> glyphBounds [

	self flag:'labordep: remove me when a SmockFontExtent is working'.
	^ glyphBounds
]

{ #category : #accessing }
SmockAeContext >> glyphBounds: anObject [

	self flag:'labordep: remove me when a SmockFontExtent is working'.
	glyphBounds := anObject
]

{ #category : #accessing }
SmockAeContext >> glyphs [

	^ glyphs
]

{ #category : #accessing }
SmockAeContext >> glyphs: anObject [

	glyphs := anObject
]

{ #category : #accessing }
SmockAeContext >> needToComputeGlyphBounds [

	^ needToComputeGlyphBounds ifNil: [ needToComputeGlyphBounds := true ]
]

{ #category : #accessing }
SmockAeContext >> needToComputeGlyphBounds: anObject [

	needToComputeGlyphBounds := anObject
]

{ #category : #notification }
SmockAeContext >> propertyHasChanged: aSymbol [

	(#( #position ) includes: aSymbol) ifTrue: [
			self needToComputeBounds: true.
			^ self ].

	(#( #text #smockFont ) includes: aSymbol) ifFalse: [ ^ self ].
	self needToComputeGlyphBounds: true
]
