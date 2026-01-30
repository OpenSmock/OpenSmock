Class {
	#name : #SmockAeContext,
	#superclass : #SmockGraphicContext,
	#instVars : [
		'glyphs',
		'glyphBounds',
		'glyphMetrics',
		'fontExtents',
		'needToComputeGlyphBounds',
		'scaledFont'
	],
	#category : #'OpenSmock-Alexandrie'
}

{ #category : #accessing }
SmockAeContext >> cairoScaledFont [

	self
		deprecated: 'use scaledFont'
		transformWith:
		'`@receiver cairoScaledFont' -> '`@receiver scaledFont'.

	^ self scaledFont
]

{ #category : #accessing }
SmockAeContext >> cairoScaledFont: anObject [

	self
		deprecated: 'use scaledFont:'
		transformWith:
		'`@receiver cairoScaledFont: `@anObject' -> '`@receiver scaledFont: `@anObject'.

	self scaledFont: anObject
]

{ #category : #accessing }
SmockAeContext >> fontExtents [

	^ fontExtents
]

{ #category : #accessing }
SmockAeContext >> fontExtents: anObject [

	fontExtents := anObject
]

{ #category : #accessing }
SmockAeContext >> glyphBounds [

	^ glyphBounds
]

{ #category : #accessing }
SmockAeContext >> glyphBounds: anObject [

	glyphBounds := anObject
]

{ #category : #accessing }
SmockAeContext >> glyphMetrics [

	^ glyphMetrics
]

{ #category : #accessing }
SmockAeContext >> glyphMetrics: anObject [

	glyphMetrics := anObject
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

{ #category : #accessing }
SmockAeContext >> scaledFont [

	^ scaledFont
]

{ #category : #accessing }
SmockAeContext >> scaledFont: anObject [

	scaledFont := anObject
]
