Class {
	#name : #SmockFillStyle,
	#superclass : #SmockPaintStyle,
	#category : #'OpenSmock-Core'
}

{ #category : #accessing }
SmockFillStyle class >> paint: aColor [

	| tmp |
	tmp := self new initialize.
	tmp paint: aColor.
	^ tmp
]
