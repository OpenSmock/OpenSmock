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

	rotationAngleInDegrees ~= anAngleInDegrees ifFalse:[ ^ self ].
	rotationAngleInDegrees := anAngleInDegrees.
	
	self rotationHasChanged: anAngleInDegrees 
]

{ #category : #'private - rotation' }
TSmockRotatable >> rotationHasChanged: aNewValue [
	"Implemented me when needed"
]

{ #category : #accessing }
TSmockRotatable >> rotationInDegrees [

	^ self rotation
]

{ #category : #accessing }
TSmockRotatable >> rotationInDegrees: anAngleInDegrees [

	self rotation: anAngleInDegrees
]
