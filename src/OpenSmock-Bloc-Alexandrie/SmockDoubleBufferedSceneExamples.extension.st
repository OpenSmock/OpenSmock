Extension { #name : #SmockDoubleBufferedSceneExamples }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockDoubleBufferedSceneExamples class >> exampleSquareMap [

	| space element |
	element := SmockDoubleBufferedSquareMapBuildingExampleElement new.
	space := self openBlElementInSpace: element.
	^ space
]
