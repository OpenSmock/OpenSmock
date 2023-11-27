Extension { #name : #Color }

{ #category : #'*OpenSmock' }
Color class >> R: r G: g B: b [
	"Return a color with the given R, G, and B components in the range [0..255]."
	"(Color R: 255 G: 255 B: 255) >>> Color white"

	^ self r: r g: g b: b range: 255
]

{ #category : #'*OpenSmock' }
Color class >> R: r G: g B: b A: alpha [
	"Return a color with the given R, G, and B components in the range [0..255] and an alpha in the range [0.0..1.0]."
	"(Color R: 255 G: 255 B: 255 A: 1) >>> Color white"
	"(Color R: 255 G: 255 B: 255 A: 0.5) >>> (Color white alpha: 0.5)"

	| c |
	c := self r: r g: g b: b range: 255.
	^ c alpha: alpha
]

{ #category : #'*OpenSmock' }
Color >> contrast: aColor [
	"Get a constrast ratio between to colors. 
	Constrast is computed from luminance value of these colors.
	Formula L1/L2 is based on ISO-9241-3 and ANSI-HFES-100-1988.
	https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests"
	
	| l1 l2 |
	l1 := self relativeLuminance.
	l2 := aColor relativeLuminance.
	
	^ l1 > l2 ifTrue:[ 
		(l1 + 0.05) / (l2 + 0.05)
	] ifFalse:[
		(l2 + 0.05) / (l1 + 0.05)
	]
]

{ #category : #'*OpenSmock' }
Color >> isContrastCompliantForISO92413: aColor [

	^ (self contrast: aColor) > 3
]

{ #category : #'*OpenSmock' }
Color >> isContrastCompliantForWCAG2AA: aColor [

	^ (self contrast: aColor) > 4.5
]

{ #category : #'*OpenSmock' }
Color >> isContrastCompliantForWCAG2AAA: aColor [

	^ (self contrast: aColor) > 7
]

{ #category : #'*OpenSmock' }
Color >> relativeLuminance [
	"Return the relative luminance of this color, a derivation of luminance signal from ITU-R BT.709-6 to considere human eye colors different sensitivity.
	https://en.wikipedia.org/wiki/SRGB
	https://www.w3.org/TR/WCAG20-TECHS/G17.html#G17-tests"

	| r g b a |
	"Force to convert from 8 bits to 0..1 for considering rounded values"
	r := (self red * 255) asInteger / 255.
	g := (self green * 255) asInteger / 255.
	b := (self blue * 255) asInteger / 255.
	a := 0.055.
	
	r := ( r <= 0.04045 ifTrue:[ r / 12.92 ] ifFalse:[ (r + a / (1 + a)) raisedTo: 2.4 ] ).	
	g := ( r <= 0.04045 ifTrue:[ g / 12.92 ] ifFalse:[ (g + a / (1 + a)) raisedTo: 2.4 ] ).	
	b := ( r <= 0.04045 ifTrue:[ b / 12.92 ] ifFalse:[ (b + a / (1 + a)) raisedTo: 2.4 ] ).	
	
	^ ( 0.2126 * r ) + ( 0.7152 * g ) + ( 0.0722 * b )
]
