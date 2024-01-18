"
A SmockFontTest is a test class for testing the behavior of SmockFont
"
Class {
	#name : #SmockFontTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Cases - Core'
}

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
