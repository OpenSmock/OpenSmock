"
Factorisation of DShape management
"
Trait {
	#name : #TSmockDShapeProcessData,
	#category : #'OpenSmock-DShape'
}

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processCreatedDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	aGShape2D id: aKey
]

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processRecycledDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	aGShape2D id: nil.
	aGShape2D removeProperties
]

{ #category : #'processing - dshape' }
TSmockDShapeProcessData >> processUpdatedDShape: aKey incoming: aDShape with: aGShape2D context: aContext [

	aGShape2D isVisible: aDShape isVisible.
	aGShape2D properties: aDShape properties copy.
	aGShape2D isTranslatedByParent: aDShape isTranslatedByParent.
	aGShape2D zIndex: aDShape zIndex.
]
