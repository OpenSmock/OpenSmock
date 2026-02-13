Trait {
	#name : #TSmockPickable,
	#instVars : [
		'isPickable'
	],
	#category : #'OpenSmock-Picking'
}

{ #category : #picking }
TSmockPickable >> defaultIsPickable [

	^ true
]

{ #category : #picking }
TSmockPickable >> isPickable [

	^ isPickable ifNil: [ isPickable := self defaultIsPickable ]
]

{ #category : #picking }
TSmockPickable >> isPickable: aBoolean [

	isPickable := aBoolean
]
