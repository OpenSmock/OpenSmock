"
By default this traits implements GShape picking, but can be overriden to use custom picking (without gShapes).
"
Trait {
	#name : #TSmockCanPopulatePickingResult,
	#category : #'OpenSmock-Picking'
}

{ #category : #'private - picking' }
TSmockCanPopulatePickingResult >> createPickedElement [

	^ SmockPickedElement new
]

{ #category : #'private - picking' }
TSmockCanPopulatePickingResult >> gShapesToPick: aPickingResult [
	"Return gShapes to pick in case of supporting gShape, if not return an empty list. 
	Can use the picking result to implement an optimized extraction of the GShapes (for example to implement a Tree or a bounds selection)"

	^ #(  )
]

{ #category : #picking }
TSmockCanPopulatePickingResult >> populatePickingResult: aPickingResult [

	| datas |
	datas := self gShapesToPick: aPickingResult.

	datas do: [ :gShape |
		self
			populatePickingResult: aPickingResult
			at: gShape id
			withGShape: gShape ]
]

{ #category : #'private - picking' }
TSmockCanPopulatePickingResult >> populatePickingResult: aPickingResult at: index withGShape: aGShape [
	"Way to detect if the gShape is picked"

	| distanceInPixels pickedElement |
	
	distanceInPixels := 0.
	
	aPickingResult isPointPicking ifTrue:[
		distanceInPixels := aPickingResult pickingDistanceBlock value: aGShape value: aPickingResult localPoint.
		(distanceInPixels notNil and: [ distanceInPixels <= aPickingResult distanceInPixels ]) ifFalse: [ ^ nil ].
	] ifFalse:[
		aPickingResult isRectanglePicking ifTrue:[
			aPickingResult isInclusive ifTrue:[
				(aGShape containedInRect: aPickingResult localRectangle select: aPickingResult pickableGShapeBlock) ifFalse:[ ^ nil ]
			] ifFalse:[
				(aGShape intersects: aPickingResult localRectangle select: aPickingResult pickableGShapeBlock) ifFalse:[ ^ nil ].
			].
		] ifFalse:[ "not supported picking" ^ nil ].
	].

	"Store the element into the result"
	pickedElement := self createPickedElement.
	pickedElement distanceInPixels: distanceInPixels.
	pickedElement objectIndex: index.
	pickedElement gShape: aGShape.

	aPickingResult addPickedElement: pickedElement.
	
 	^ pickedElement 
]
