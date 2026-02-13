"
Factorisation of DShape management
"
Trait {
	#name : #TSmockDShapeProcessData,
	#category : #'OpenSmock-DShape'
}

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processCreatedDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	"Setup the id"
	aGShape2D id: aKey
]

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processRecycledDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	"Reset GShape properties"
	aGShape2D id: nil.
	aGShape2D isVisible: true.
	aGShape2D removeProperties.
	aGShape2D isTranslatedByParent: true. 
	aGShape2D effect: nil.
	aGShape2D zIndex: 0.
	aGShape2D isPickable: (aGShape2D defaultIsPickable).
]

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processUpdatedDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	"Copy all properties from DShape to GShape, except properties that need to be a pointer"
	aGShape2D isVisible: aDShape isVisible copy.
	aGShape2D properties: aDShape properties copy.
	aGShape2D isTranslatedByParent: aDShape isTranslatedByParent copy.
	aGShape2D effect: aDShape effect. "Inject effect pointer"
	aGShape2D zIndex: aDShape zIndex copy.
	aGShape2D isPickable: aDShape isPickable copy
]
