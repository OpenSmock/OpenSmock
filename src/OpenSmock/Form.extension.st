Extension { #name : #Form }

{ #category : #'*OpenSmock' }
Form >> fillWithCloudOfColors: aColorList [
	"Fill each pixels of the image with a color list (randomized)"

	| poker random |
	aColorList ifEmpty: [ ^ self fillWithNoise ].
	
	poker := BitBlt bitPokerToForm: self.
	random := Random new.

	0 to: height - 1 do: [ :y |
			0 to: width - 1 do: [ :x |
					| color |
					color := aColorList atRandom: random.
					poker pixelAt: x @ y put: (self pixelValueFor: color) ] ]
]

{ #category : #'*OpenSmock' }
Form >> fillWithNoise [
	"Fill a form with randomized cloud of colors as noise"

	| poker |
	poker := BitBlt bitPokerToForm: self.
	0 to: height - 1 do: [ :y |
			0 to: width - 1 do: [ :x |
					| color |
					color := Color random.
					poker pixelAt: x @ y put: (self pixelValueFor: color) ] ]
]
