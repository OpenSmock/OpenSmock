Class {
	#name : #SmockScaledFont,
	#superclass : #Object,
	#instVars : [
		'fontDescription',
		'height',
		'scaledFont',
		'fontOptions'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockScaledFont >> computeScaledFont [

	((fontOptions isNil) or: [ fontOptions isNull ]) ifTrue: [
		fontOptions := AeCairoFontOptions new
			               antialias: AeCairoAntialias fast;
			               hintMetrics: AeCairoHintMetrics on;
			               hintStyle: AeCairoHintStyle slight;
			               subpixelOrder: AeCairoSubpixelOrder default ].
	scaledFont := AeCairoScaledFont
		              fontFace:
			               fontDescription cachedFontFace
		              fontMatrix:
		              (AeCairoMatrix
			               newScalingByX: self height
			               y: self height)
		              userToDeviceMatrix: AeCairoMatrix newIdentity
		              options: fontOptions.
	^ scaledFont
]

{ #category : #accessing }
SmockScaledFont >> fontDescription [

	^ fontDescription
]

{ #category : #accessing }
SmockScaledFont >> fontDescription: anObject [

	fontDescription := anObject.
	scaledFont := nil.
]

{ #category : #accessing }
SmockScaledFont >> fontDescription: anObject height: aValue [

	height := aValue.
	fontDescription := anObject.
	scaledFont := nil
]

{ #category : #accessing }
SmockScaledFont >> glyphArrayForString: aString [ 
^self scaledFont glyphArrayForString: aString 
]

{ #category : #accessing }
SmockScaledFont >> height [
	height ifNil:[ height := 8 ].
	^ height
]

{ #category : #accessing }
SmockScaledFont >> height: anObject [

	height := anObject.
	scaledFont := nil.
]

{ #category : #accessing }
SmockScaledFont >> scaledFont [

	(scaledFont isNil or:[scaledFont isNull]) ifTrue: [ self computeScaledFont ].
	^scaledFont
]
