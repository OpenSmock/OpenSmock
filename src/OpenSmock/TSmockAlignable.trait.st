Trait {
	#name : #TSmockAlignable,
	#instVars : [
		'xAlign',
		'yAlign'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'alignments setup' }
TSmockAlignable >> setBottom [

	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockAlignable >> setBottomCenter [

	self xAlign: #center.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockAlignable >> setBottomLeft [

	self xAlign: #left.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockAlignable >> setBottomRight [

	self xAlign: #right.
	self yAlign: #bottom
]

{ #category : #'alignments setup' }
TSmockAlignable >> setCenter [

	self xAlign: #center.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockAlignable >> setLeft [

	self xAlign: #left.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockAlignable >> setRight [

	self xAlign: #right.
	self yAlign: #center
]

{ #category : #'alignments setup' }
TSmockAlignable >> setTop [

	self yAlign: #top
]

{ #category : #'alignments setup' }
TSmockAlignable >> setTopCenter [

	self xAlign: #center.
	self yAlign: #top
]

{ #category : #'alignments setup' }
TSmockAlignable >> setTopLeft [

	self xAlign: #left.
	self yAlign: #top
]

{ #category : #'alignments setup' }
TSmockAlignable >> setTopRight [

	self xAlign: #right.
	self yAlign: #top
]

{ #category : #accessing }
TSmockAlignable >> xAlign [

	^ xAlign ifNil: [ xAlign := #center ]
]

{ #category : #accessing }
TSmockAlignable >> xAlign: aSymbol [

	xAlign := aSymbol
]

{ #category : #accessing }
TSmockAlignable >> yAlign [

	^ yAlign ifNil: [ yAlign := #center ]
]

{ #category : #accessing }
TSmockAlignable >> yAlign: aSymbol [

	yAlign := aSymbol
]
