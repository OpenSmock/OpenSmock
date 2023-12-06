Class {
	#name : #SmockGCompositeShape2D,
	#superclass : #SmockGShape2D,
	#category : #'OpenSmock-GShape'
}

{ #category : #drawing }
SmockGCompositeShape2D >> aeDrawOn: aeCanvas [

	self flag:'labordep: draw children'.
]
