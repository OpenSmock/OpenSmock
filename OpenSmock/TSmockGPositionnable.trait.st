Trait {
	#name : #TSmockGPositionnable,
	#instVars : [
		'xAlign',
		'yAlign'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #accessing }
TSmockGPositionnable >> setLeft [

	self xAlign: #left.
	self yAlign: #center.
]

{ #category : #accessing }
TSmockGPositionnable >> setRight [

	self xAlign: #right.
	self yAlign: #center
]

{ #category : #accessing }
TSmockGPositionnable >> setToCenter [
self xAlign: #center.
self yAlign: #center.

]

{ #category : #accessing }
TSmockGPositionnable >> setTopLeft [

	self xAlign: #left.
	self yAlign: #top
]

{ #category : #accessing }
TSmockGPositionnable >> xAlign [
	xAlign ifNil:[ xAlign := #center ].
	^ xAlign
]

{ #category : #accessing }
TSmockGPositionnable >> xAlign: anObject [

	xAlign := anObject
]

{ #category : #accessing }
TSmockGPositionnable >> yAlign [

	^ yAlign
]

{ #category : #accessing }
TSmockGPositionnable >> yAlign: anObject [

	yAlign := anObject
]
