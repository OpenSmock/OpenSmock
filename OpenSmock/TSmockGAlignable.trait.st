Trait {
	#name : #TSmockGAlignable,
	#instVars : [
		'xAlign',
		'yAlign'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #'alignments setup' }
TSmockGAlignable >> setBottomCenter [

	self xAlign: #center.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setBottomLeft [

	self xAlign: #left.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setBottomRight [

	self xAlign: #right.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setCenter [

	self xAlign: #center.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setLeft [

	self xAlign: #left.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setRight [

	self xAlign: #right.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setTopCenter [

	self xAlign: #center.
	self yAlign: #top
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setTopLeft [

	self xAlign: #left.
	self yAlign: #top
]

{ #category : #'alignments setup' }
TSmockGAlignable >> setTopRight [

	self xAlign: #right.
	self yAlign: #top
]

{ #category : #accessing }
TSmockGAlignable >> xAlign [

	^ xAlign ifNil: [ xAlign := #center ]
]

{ #category : #accessing }
TSmockGAlignable >> xAlign: aSymbol [

	xAlign := aSymbol
]

{ #category : #accessing }
TSmockGAlignable >> yAlign [

	^ yAlign ifNil: [ yAlign := #center ]
]

{ #category : #accessing }
TSmockGAlignable >> yAlign: aSymbol [

	yAlign := aSymbol
]
