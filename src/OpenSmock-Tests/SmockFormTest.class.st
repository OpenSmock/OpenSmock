"
This class contains tests for Form extension
"
Class {
	#name : #SmockFormTest,
	#superclass : #TestCase,
	#category : #'OpenSmock-Tests-Core'
}

{ #category : #tests }
SmockFormTest >> testFillWithCloudOfColors [

	| form width height |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self assert: (form colorAt: x @ y) isTransparent ] ].

	form fillWithCloudOfColors: {
			Color black.
			Color white.
			Color red }.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
					| color |
					color := form colorAt: x @ y.
					self assert: (color = Color black or: [
							 color = Color white or: [ color = Color red ] ]) ] ]
]

{ #category : #tests }
SmockFormTest >> testFillWithCloudOfColorsWithEmptyColorList [

	| form width height |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self assert: (form colorAt: x @ y) isTransparent ] ].

	"equivalent to fill with noise"
	form fillWithCloudOfColors: { }.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self deny: (form colorAt: x @ y) isTransparent ] ]
]

{ #category : #tests }
SmockFormTest >> testFillWithNoise [

	| form width height |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self assert: (form colorAt: x @ y) isTransparent ] ].

	form fillWithNoise.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self deny: (form colorAt: x @ y) isTransparent ] ]
]
