Extension { #name : #Color }

{ #category : #'*OpenSmock' }
Color >> asSmockFillStyle [

	^ SmockFillStyle new paint: self; yourself
]

{ #category : #'*OpenSmock' }
Color >> asSmockStrokeStyle [

	^ SmockStrokeStyle new paint: self; yourself
]

{ #category : #'*OpenSmock' }
Color >> printRGBA [
	"Return RGBA string"

	^ String streamContents: [ :s |
				s
					nextPutAll: self class name;
					nextPutAll: ' R: '.
				(self red * 255 roundTo: 1) printOn: s.
				s nextPutAll: ' G: '.
				(self green * 255 roundTo: 1) printOn: s.
				s nextPutAll: ' B: '.
				(self blue * 255 roundTo: 1) printOn: s.
				s nextPutAll: ' A: '.
				(self alpha roundTo: 0.01) printOn: s. 
		]
]

{ #category : #'*OpenSmock' }
Color class >> randomRGB [
	"Return a random RGB color. This methods should be replaced by a futur Color>>random method without contrast limitation in the Pharo core"

	^ self randomRGB: nil
]

{ #category : #'*OpenSmock' }
Color class >> randomRGB: aRandom [
	"Return a random color using a random instance to control the randomization. This methods should be replaced by a futur Color>>random: method in the Pharo core"

	| random |
	random := aRandom ifNil: [ SharedRandom globalGenerator ].

	^ self
		  R: (random next * 255) asInteger
		  G: (random next * 255) asInteger
		  B: (random next * 255) asInteger
]

{ #category : #'*OpenSmock' }
Color class >> randomRGBA [
	"Return a random RGB color with an alpha. This methods should be replaced by a futur Color>>random method without contrast limitation in the Pharo core"

	^ self randomRGBA: nil
]

{ #category : #'*OpenSmock' }
Color class >> randomRGBA: aRandom [
	"Return a random RGB color with an alpha using a random instance to control the randomization. This methods should be replaced by a futur Color>>random: method in the Pharo core"

	| random color |
	random := aRandom ifNil: [ SharedRandom globalGenerator ].

	color := self randomRGB: random.
	^ color alpha: random next
]
