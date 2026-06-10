Extension { #name : #SmockGArcBand2D }

{ #category : #'*OpenSmock-Bloc-Alexandrie' }
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
