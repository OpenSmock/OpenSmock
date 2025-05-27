Extension { #name : #SmockStrokeStyle }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockStrokeStyle >> setStyleInAeCanvas: aeCanvas forGShape: aGLeafShape [

	self paint ifNil: [ ^ self ].
	super setStyleInAeCanvas: aeCanvas forGShape: aGLeafShape.

	"process stroke properties"
	self dashes ifNotNil: [ :e |
		aeCanvas setDashes: e offset: self dashOffset ].

	self lineJoin = #round ifTrue: [ aeCanvas setJoinRound ].

	aeCanvas setBorderWidth: self width
]
