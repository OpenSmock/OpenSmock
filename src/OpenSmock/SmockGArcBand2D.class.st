Class {
	#name : #SmockGArcBand2D,
	#superclass : #SmockGLeafShape2D,
	#instVars : [
		'radiusMin',
		'radiusMax',
		'fromInDegrees',
		'toInDegrees'
	],
	#category : #'OpenSmock-GShape'
}

{ #category : #'as yet unclassified' }
SmockGArcBand2D >> basicAeDrawOn: aeCanvas [
    super basicAeDrawOn: aeCanvas.
    aeCanvas pathFactory: [ :cairoContext |
        cairoContext
            annulusSectorCenter: self position
            from: self from degreesToRadians
            to: self to degreesToRadians
            innerRadius: self radiusMin
            outerRadius: self radiusMax ].
    self injectFillStyleInAeCanvas: aeCanvas.
    self injectStrokeStyleInAeCanvas: aeCanvas.
    aeCanvas drawFigure
]

{ #category : #'instance creation' }
SmockGArcBand2D >> from [

		^ fromInDegrees
]

{ #category : #'instance creation' }
SmockGArcBand2D >> from: anObject [

	fromInDegrees := anObject
]

{ #category : #accessing }
SmockGArcBand2D >> fromInDegrees [

	^ self from
]

{ #category : #accessing }
SmockGArcBand2D >> fromInDegrees: anObject [

	self from: anObject
]

{ #category : #testing }
SmockGArcBand2D >> isDrawable [
    super isDrawable ifFalse: [ ^ false ].
    self position ifNil: [ ^ false ].
    self from ifNil: [ ^ false ].
    self to ifNil: [ ^ false ].
    self radiusMin ifNil: [ ^ false ].
    self radiusMax ifNil: [ ^ false ].
    self radiusMin = 0 ifTrue: [ ^ false ].
    self radiusMax = 0 ifTrue: [ ^ false ].
    self radiusMin >= self radiusMax ifTrue: [ ^ false ].
    ^ true
]

{ #category : #accessing }
SmockGArcBand2D >> radiusMax [

	^ radiusMax
]

{ #category : #accessing }
SmockGArcBand2D >> radiusMax: anObject [

	radiusMax := anObject
]

{ #category : #accessing }
SmockGArcBand2D >> radiusMin [

	^ radiusMin
]

{ #category : #accessing }
SmockGArcBand2D >> radiusMin: anObject [

	radiusMin := anObject
]

{ #category : #accessing }
SmockGArcBand2D >> to [

	^ toInDegrees 
]

{ #category : #accessing }
SmockGArcBand2D >> to: anObject [

	toInDegrees := anObject
]

{ #category : #accessing }
SmockGArcBand2D >> toInDegrees [

	^ self to
]

{ #category : #accessing }
SmockGArcBand2D >> toInDegrees: anObject [

	self to: anObject
]
