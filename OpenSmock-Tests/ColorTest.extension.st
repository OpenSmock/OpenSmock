Extension { #name : #ColorTest }

{ #category : #'*OpenSmock-Tests' }
ColorTest >> testContrast [

	self assert: (Color black contrast: Color black) equals: 1.0.
	self assert: (Color white contrast: Color white) equals: 1.0.
	
	self assert: (Color black contrast: Color white) equals: 21.0.
	self assert: (Color white contrast: Color black) equals: 21.0.
	
	Color indexedColors do:[ :c | self assert: (c contrast: c) equals: 1.0. ].
]

{ #category : #'*OpenSmock-Tests' }
ColorTest >> testIsContrastCompliantFor [

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
ColorTest >> testRelativeLuminance [

	self assert: Color black relativeLuminance equals: 0.0.
	self assert: Color white relativeLuminance equals: 1.0.

	Color indexedColors do: [ :c | | l |
		l := c relativeLuminance.
		self assert: (l between: 0 and: 1) 
	]
]
