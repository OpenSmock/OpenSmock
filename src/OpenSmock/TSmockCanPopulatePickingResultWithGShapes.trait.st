Trait {
	#name : #TSmockCanPopulatePickingResultWithGShapes,
	#traits : 'TSmockPickable',
	#classTraits : 'TSmockPickable classTrait',
	#category : #'OpenSmock-Picking'
}

{ #category : #'private - picking' }
TSmockCanPopulatePickingResultWithGShapes >> createPickingElement [

	^ SmockPickingElement new
]

{ #category : #'private - picking' }
TSmockCanPopulatePickingResultWithGShapes >> gShapesToPick [
	"return datas to pick"

	self explicitRequirement
]

{ #category : #picking }
TSmockCanPopulatePickingResultWithGShapes >> populatePickingResult: aPickingResult [

	| datas |
	datas := self gShapesToPick.

	datas do: [ :gShape |
		self
			populatePickingResult: aPickingResult
			at: gShape id
			with: gShape ]
]

{ #category : #'private - picking' }
TSmockCanPopulatePickingResultWithGShapes >> populatePickingResult: aPickingResult at: index with: aGShape [
	"Way to detect if the gShape is picked"

	| distanceInPixels pickingElement |
	distanceInPixels := aPickingResult pickingDistanceBlock value: aGShape value: aPickingResult localPoint.
	(distanceInPixels notNil and: [ distanceInPixels <= aPickingResult radiusInPixels ]) ifFalse: [ ^ nil ].

	"Store the element into the result"
	pickingElement := self createPickingElement.
	pickingElement distanceInPixels: distanceInPixels.
	pickingElement objectIndex: index.
	pickingElement gShape: aGShape.

	aPickingResult addPickingElement: pickingElement.
	
 	^ pickingElement 
]
