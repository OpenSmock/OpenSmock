Trait {
	#name : #TSmockPickable,
	#instVars : [
		'pickable'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #picking }
TSmockPickable >> isPickableByDefault [

	^ true
]

{ #category : #picking }
TSmockPickable >> pickable [

	^ pickable ifNil: [ pickable := self isPickableByDefault ]
]

{ #category : #picking }
TSmockPickable >> pickable: aBoolean [

	pickable := aBoolean
]
