"
Simplification of API for AeFontManager
"
Class {
	#name : #SmockFontManager,
	#superclass : #Object,
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockFontManager class >> detectFont: aSmockFont [
^AeFontManager globalInstance detectFamilyName: aSmockFont fontName slant: (AeFontSlant perform: aSmockFont fontSlant) weight: (AeFontWeight  perform: aSmockFont fontWeight)  stretch: (AeFontStretch  perform: aSmockFont fontStretch) ifNone: [nil].
]

{ #category : #accessing }
SmockFontManager class >> detectFont: aSmockFont ifAbsent: aBlock [
^AeFontManager globalInstance detectFamilyName: aSmockFont fontName slant: aSmockFont fontSlant weight: aSmockFont fontWeight  stretch: aSmockFont fontStretch ifNone: aBlock.
]

{ #category : #accessing }
SmockFontManager class >> fontList [
<script: 'self fontList inspect'>
^AeFontManager globalInstance faceEntries collect:[ :e | e familyName ]
]
