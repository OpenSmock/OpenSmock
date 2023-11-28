Extension { #name : #SmockColorTest }

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testContrast [

	self assert: (Color black contrast: Color black) equals: 1.0.
	self assert: (Color white contrast: Color white) equals: 1.0.
	
	self assert: (Color black contrast: Color white) equals: 21.
	self assert: (Color white contrast: Color black) equals: 21.
	
	Color indexedColors do:[ :c | self assert: (c contrast: c) equals: 1.0. ].
]

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testIsContrastCompliantFor [

	self assert: (Color black isContrastCompliantForISO92413: Color white).
	self assert: (Color black isContrastCompliantForWCAG2AA: Color white).
	self assert: (Color black isContrastCompliantForWCAG2AAA: Color white).
	
	self assert: (Color white isContrastCompliantForISO92413: Color black).
	self assert: (Color white isContrastCompliantForWCAG2AA: Color black).
	self assert: (Color white isContrastCompliantForWCAG2AAA: Color black).
	
	self assert: ((Color fromHexString: 'A10000') isContrastCompliantForISO92413: Color white).
	self assert: ((Color fromHexString: 'A10000') isContrastCompliantForWCAG2AA: Color white).
	self assert: ((Color fromHexString: 'A10000') isContrastCompliantForWCAG2AAA: Color white).
	
	self deny: ((Color fromHexString: 'FF7373') isContrastCompliantForISO92413: Color white).
	self deny: ((Color fromHexString: 'FF7373') isContrastCompliantForWCAG2AA: Color white).
	self deny: ((Color fromHexString: 'FF7373') isContrastCompliantForWCAG2AAA: Color white).
	
]

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testPrintRGBA [

	self assert: (Color R: 0 G: 0 B: 0) printRGBA equals: 'Color R: 0 G: 0 B: 0 A: 1.0'.
	self assert: (Color R: 255 G: 255 B: 255) printRGBA equals: 'Color R: 255 G: 255 B: 255 A: 1.0'.
	self assert: (Color R: 255 G: 0 B: 0) printRGBA equals: 'Color R: 255 G: 0 B: 0 A: 1.0'.
	self assert: (Color R: 0 G: 255 B: 0) printRGBA equals: 'Color R: 0 G: 255 B: 0 A: 1.0'.
	self assert: (Color R: 0 G: 0 B: 255)printRGBA equals: 'Color R: 0 G: 0 B: 255 A: 1.0'.
]

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testRGB [

	self assert: (Color R: 0 G: 0 B: 0) equals: Color black.
	self assert: (Color R: 255 G: 255 B: 255) equals: Color white.
	self assert: (Color R: 255 G: 0 B: 0) equals: Color red.
	self assert: (Color R: 0 G: 255 B: 0) equals: Color green.
	self assert: (Color R: 0 G: 0 B: 255) equals: Color blue.	
]

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testRGBA [

	self assert: (Color R: 0 G: 0 B: 0 A: 1) equals: Color black.
	self assert: (Color R: 255 G: 255 B: 255 A: 1) equals: Color white.
	self assert: (Color R: 255 G: 0 B: 0 A: 1) equals: Color red.
	self assert: (Color R: 0 G: 255 B: 0 A: 1) equals: Color green.
	self assert: (Color R: 0 G: 0 B: 255 A: 1) equals: Color blue.	
	
	self assert: (Color R: 0 G: 0 B: 0 A: 0.5) equals: (Color black alpha: 0.5).
	self assert: (Color R: 255 G: 255 B: 255 A: 0.5) equals: (Color white alpha: 0.5).
	self assert: (Color R: 255 G: 0 B: 0 A: 0.5) equals: (Color red alpha: 0.5).
	self assert: (Color R: 0 G: 255 B: 0 A: 0.5) equals: (Color green alpha: 0.5).
	self assert: (Color R: 0 G: 0 B: 255 A: 0.5) equals: (Color blue alpha: 0.5).
]

{ #category : #'*OpenSmock-Tests' }
SmockColorTest >> testRelativeLuminance [

	self assert: Color black relativeLuminance equals: 0.0.
	self assert: Color white relativeLuminance equals: 1.0.

	Color indexedColors do: [ :c | | l |
		l := c relativeLuminance.
		self assert: (l between: 0 and: 1) 
	]
]
