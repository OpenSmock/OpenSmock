Extension { #name : #SmockFont }

{ #category : #'*OpenSmock-Alexandrie' }
SmockFont class >> aeDetectFont: aSmockFont [

	^ AeFontManager globalInstance
		  detectFamilyName: aSmockFont fontName
		  slant: (AeFontSlant perform: aSmockFont fontSlant)
		  weight: (AeFontWeight perform: aSmockFont fontWeight)
		  stretch: (AeFontStretch perform: aSmockFont fontStretch)
		  ifNone: [ nil ]
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockFont class >> aeDetectFont: aSmockFont ifAbsent: aBlock [

	^ AeFontManager globalInstance
		  detectFamilyName: aSmockFont fontName
		  slant: aSmockFont fontSlant
		  weight: aSmockFont fontWeight
		  stretch: aSmockFont fontStretch
		  ifNone: aBlock
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockFont class >> aeFontList [
	<script: 'self fontList inspect'>

	^ AeFontManager globalInstance faceEntries collect: [ :e |
		  e familyName ]
]
