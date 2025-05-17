"
A SmockFontTest is a test class for testing the behavior of SmockFont
"
Class {
	#name : #SmockFontTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockFontTest >> testDefaultFont [

	| font |
	font := SmockFont defaultFont.
	self assert: (font isKindOf: SmockFont).
	self assert: font fontName equals: SmockFont defaultFontName.
	self assert: font fontSize equals: SmockFont defaultFontSize.
]

{ #category : #tests }
SmockFontTest >> testDefaultFontName [

	| name |
	name := SmockFont defaultFontName.
	self assert: name isString.
]

{ #category : #tests }
SmockFontTest >> testDefaultFontSize [

	| size |
	size := SmockFont defaultFontSize.
	self assert: size equals: 10.
]

{ #category : #tests }
SmockFontTest >> testDetectFont [

	| font |
	font := SmockFont new.
	font detectFont "no error should be raised here". 
	
	font := SmockFont defaultFont.
	font detectFont. "no error should be raised here".
	
	self assert: (SmockFont detectFont: nil) isNil.
]

{ #category : #tests }
SmockFontTest >> testEquals [

	self assert: SmockFont defaultFont equals: SmockFont defaultFont.
	self deny: SmockFont defaultFont equals: nil.
	self deny: SmockFont defaultFont equals: (SmockFont named: 'Arial').
]

{ #category : #tests }
SmockFontTest >> testFontName [
| sf |
sf := SmockFont named:'cette font n existe pas'.
self assert: sf fontSize equals: 10.
self assert: sf fontWeight equals: #normal.
self assert: sf fontSlant equals: #normal.
self assert: sf fontStretch equals: #normal.
self assert: sf exists equals: false.
]

{ #category : #tests }
SmockFontTest >> testRealFonts [
| sf sfn f |
sfn := SmockFont allFontNames asArray first.
sf := SmockFont named:sfn.
self assert: sf exists equals: true.
self assert: (sf getFamilyList isNotEmpty ) equals: true.
self assert: (sf getFamilyFonts isNotEmpty ) equals: true.
f := sf nearestFont.
self assert: (f isNil) equals: false.
self assert: f exists equals: true.

]
