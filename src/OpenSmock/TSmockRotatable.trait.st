Trait {
	#name : #TSmockRotatable,
	#instVars : [
		'rotationAngleInDegrees'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
TSmockRotatable >> rotation [

	^ rotationAngleInDegrees
]

{ #category : #accessing }
TSmockRotatable >> rotation: anAngleInDegrees [

	rotationAngleInDegrees := anAngleInDegrees
]

{ #category : #accessing }
TSmockRotatable >> rotationInDegrees [

	^ self rotation
]

{ #category : #accessing }
TSmockRotatable >> rotationInDegrees: anAngleInDegrees [

	self rotation: anAngleInDegrees
]
