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

	| form width height form2 different colors |
	width := 200.
	height := 200.
	colors := {
		          Color black.
		          Color white.
		          Color red }.
	form := Form extent: width @ height depth: 32.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self assert: (form colorAt: x @ y) isTransparent ] ].

	form fillWithCloudOfColors: colors.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
					| color |
					color := form colorAt: x @ y.
					self assert: (color = Color black or: [
							 color = Color white or: [ color = Color red ] ]) ] ].


	"Check a second form is different than the first one"
	form2 := Form extent: width @ height depth: 32.
	form fillWithCloudOfColors: colors.

	different := false.
	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
					| color |
					color := form colorAt: x @ y.
					self assert: (color = Color black or: [
							 color = Color white or: [ color = Color red ] ]).
					color ~= (form2 colorAt: x @ y) ifTrue: [ different := true ] ] ].

	self assert: different
]

{ #category : #tests }
SmockFormTest >> testFillWithCloudOfColorsSeed [

	| form width height form2 colors |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.
	colors := {
		          Color black.
		          Color white.
		          Color red }.
	form fillWithCloudOfColors: colors seed: 1.

	form2 := Form extent: width @ height depth: 32.
	form2 fillWithCloudOfColors: colors seed: 1.

	"check if a new form with same colors list and seed have same colors"
	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
					| color |
					color := form colorAt: x @ y.
					self assert: (color = Color black or: [
							 color = Color white or: [ color = Color red ] ]).
					self assert: color equals: (form2 colorAt: x @ y) ] ]
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

	| form width height form2 different |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.
	form fillWithNoise.

	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y |
			self deny: (form colorAt: x @ y) isTransparent ] ].
	
	"Check a second form is different than the first one"
	form2 := Form extent: width @ height depth: 32.
	form2 fillWithNoise.
	
	different := false.
	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y | | color |
			color := form colorAt: x @ y.
			self deny: color isTransparent.
			color ~= (form2 colorAt: x @ y) ifTrue:[ different := true ] ] ].
	
	self assert: different.

]

{ #category : #tests }
SmockFormTest >> testFillWithNoiseSeed [

	| form width height form2 |
	width := 200.
	height := 200.
	form := Form extent: width @ height depth: 32.
	form fillWithNoise: 1.	
	form2 := Form extent: width @ height depth: 32.
	form2 fillWithNoise: 1.

	"check if a new form with same seed have same colors"
	1 to: width - 1 do: [ :x |
			1 to: height - 1 do: [ :y | | color |
			color := form colorAt: x @ y.
			self deny: color isTransparent.
			self assert: color equals: (form2 colorAt: x @ y) ] ].
]
