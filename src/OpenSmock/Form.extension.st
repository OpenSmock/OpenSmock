Extension { #name : #Form }

{ #category : #'*OpenSmock' }
Form >> fillWithCloudOfColors: aColorList [
	"Fill each pixels of the image with a color list (randomized)"

	"Example (DoIt): 
	| form |
	form := Form extent: 200@200 depth: 32.
	form fillWithCloudOfColors: { Color black . Color white }.
	form inspect.
	"

	^ self fillWithCloudOfColors: aColorList seed: nil
]

{ #category : #'*OpenSmock' }
Form >> fillWithCloudOfColors: aColorList seed: aSeed [
	"Fill each pixels of the image with a color list (randomized). Can control the randomization with a seed"

	"Example (DoIt): 
	| form |
	form := Form extent: 200@200 depth: 32.
	form fillWithCloudOfColors: { Color black . Color white } seed: 1.
	form inspect.
	"

	| poker random |
	aColorList ifEmpty: [ ^ self fillWithNoise: aSeed ].
	random := aSeed
		          ifNil: [ Random new ]
		          ifNotNil: [ Random seed: aSeed ].

	poker := BitBlt bitPokerToForm: self.
	0 to: height - 1 do: [ :y |
			0 to: width - 1 do: [ :x |
					| color |
					color := aColorList atRandom: random.
					poker pixelAt: x @ y put: (self pixelValueFor: color) ] ]
]

{ #category : #'*OpenSmock' }
Form >> fillWithNoise [
	"Fill a form with randomized cloud of colors as noise"

	"Example (DoIt): 
	| form |
	form := Form extent: 200@200 depth: 32.
	form fillWithNoise.
	form inspect.
	"

	^ self fillWithNoise: nil
]

{ #category : #'*OpenSmock' }
Form >> fillWithNoise: aSeed [
	"Fill a form with randomized cloud of colors as noise, considering a seed to control the final result"

	"Example (DoIt): 
	| form |
	form := Form extent: 200@200 depth: 32.
	form fillWithNoise: 1.
	form inspect.
	"

	| poker random |
	random := aSeed
		          ifNil: [ Random new ]
		          ifNotNil: [ Random seed: aSeed ].

	poker := BitBlt bitPokerToForm: self.
	0 to: height - 1 do: [ :y |
			0 to: width - 1 do: [ :x |
					| color |
					color := Color randomRGB: random.
					poker pixelAt: x @ y put: (self pixelValueFor: color) ] ]
]
