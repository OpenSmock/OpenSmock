Extension { #name : #SmockGLeafShape2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> aeDrawOn: aeCanvas [

	self isDrawable ifFalse:[ ^ self ].

	aeCanvas restoreContextAfter: [
		self basicAeDrawOn: aeCanvas.
	]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectFillStyleInAeCanvas: aeCanvas [

	self fillStyle ifNil:[ aeCanvas setBackgroundOff. ^ self ].
	
	aeCanvas setBackgroundWith: [
		self fillStyle isColor ifTrue: [
			aeCanvas setSourceColor: self fillStyle paint 
		].
	]
]

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
SmockGLeafShape2D >> injectStrokeStyleInAeCanvas: aeCanvas [

	self strokeStyle ifNil:[ aeCanvas setBorderOff. ^ self ].

	aeCanvas setBorderBlock: [
		self strokeStyle isColor ifTrue: [
			aeCanvas setSourceColor: self strokeStyle paint.
		].
		self strokeStyle lineJoin = #round ifTrue: [ aeCanvas setJoinRound ].
		self flag: 'ELP : do others properties'.
		aeCanvas setBorderWidth: self strokeStyle width 
	].

	aeCanvas setOutskirtsCentered
]
