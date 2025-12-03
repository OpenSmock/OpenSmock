"
I'm an effect that display a background behind an object.
For example to render a text as a label.
"
Class {
	#name : #SmockBackgroundEffect,
	#superclass : #SmockPaintEffect,
	#traits : 'TSmockHavePaintStyles',
	#classTraits : 'TSmockHavePaintStyles classTrait',
	#instVars : [
		'padding'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #testing }
SmockBackgroundEffect >> canBeAppliedTo: aSmockGShape [
	"return true of false if the effect can be applied to this object"

	^ aSmockGShape isLeaf
]

{ #category : #testing }
SmockBackgroundEffect >> computeBounds: aRectangle [
	"considere padding"

	^ aRectangle expandBy: self padding
]

{ #category : #accessing }
SmockBackgroundEffect >> padding [

	^ padding ifNil: [ SmockInsets zero ]
]

{ #category : #accessing }
SmockBackgroundEffect >> padding: aSmockInsets [

	padding := aSmockInsets
]
