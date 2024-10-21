Extension { #name : #SmockGShape2DViewerElement }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGShape2DViewerElement >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	
	"Last added, last drawed"
	self gShapes do: [ :s | s aeDrawOn: aeCanvas ]
]
