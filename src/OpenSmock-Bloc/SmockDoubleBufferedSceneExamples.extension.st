Extension { #name : #SmockDoubleBufferedSceneExamples }

{ #category : #'*OpenSmock-Bloc' }
SmockDoubleBufferedSceneExamples class >> openBlElementInSpace: aBlElement [
	"open the blElement in a window"

	| space |
	aBlElement constraintsDo: [ :c |
		c vertical matchParent.
		c horizontal matchParent ].
	space := aBlElement openInSpace.
	space title: 'Smock Double Buffered Scene example'.

	^ space
]
