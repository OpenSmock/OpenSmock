Extension { #name : #SmockBackgroundEffect }

{ #category : #'*OpenSmock-Alexandrie' }
SmockBackgroundEffect >> aeDrawBelowGShape2D: aGShape2D on: anAeCanvas [

	| rectangle |
	rectangle := self computeBounds: aGShape2D bounds.

	anAeCanvas pathFactory: [ :cairoContext |
		cairoContext rectangle: rectangle ].

	self injectFillStyleInAeCanvas: anAeCanvas.
	self injectStrokeStyleInAeCanvas: anAeCanvas.

	anAeCanvas drawFigure
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockBackgroundEffect >> injectFillStyleInAeCanvas: aeCanvas [

	self fillStyle ifNil: [
			aeCanvas setBackgroundOff.
			^ self ].

	aeCanvas setBackgroundWith: [
			self fillStyle isColor ifTrue: [
				aeCanvas setSourceColor: self fillStyle paint ] ]
]

{ #category : #'*OpenSmock-Alexandrie' }
SmockBackgroundEffect >> injectStrokeStyleInAeCanvas: aeCanvas [

	self strokeStyle ifNil: [
			aeCanvas setBorderOff.
			^ self ].

	aeCanvas setBorderBlock: [
			self strokeStyle isColor ifTrue: [
				aeCanvas setSourceColor: self strokeStyle paint.
					self strokeStyle dashes ifNotNil: [ :e |
						aeCanvas setDashes: e offset: self strokeStyle dashOffset ].

					self strokeStyle lineJoin = #round ifTrue: [ aeCanvas setJoinRound ].

					aeCanvas setBorderWidth: self strokeStyle width ] ].

	self strokeStyle outskirts = #inside
		ifTrue: [ aeCanvas setOutskirtsInside ]
		ifFalse: [
				self strokeStyle outskirts = #outside
					ifTrue: [ aeCanvas setOutskirtsOutside ]
					ifFalse: [ aeCanvas setOutskirtsCentered ] ]
]
