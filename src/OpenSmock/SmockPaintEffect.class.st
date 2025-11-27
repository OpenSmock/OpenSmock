Class {
	#name : #SmockPaintEffect,
	#superclass : #Object,
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockPaintEffect class >> isAbstract [

	^ self == SmockPaintEffect
]

{ #category : #testing }
SmockPaintEffect >> canBeAppliedTo: anObject [
	"return true of false if the effect can be applied to this object"
	
	self subclassResponsibility 
]

{ #category : #testing }
SmockPaintEffect >> computeBounds: aRectangle [
	"Compute effect bounds based on provided geometry bounds.
	Default implementation simply returns given bounds"

	^ aRectangle
]
