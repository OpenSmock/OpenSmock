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
