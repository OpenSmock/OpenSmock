"
I am a Display Text.
I am used to display a text on geo view.
"
Class {
	#name : #SmockDText,
	#superclass : #SmockDLeafShape,
	#traits : 'TSmockAlignable',
	#classTraits : 'TSmockAlignable classTrait',
	#instVars : [
		'text',
		'smockFont'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #comparing }
SmockDText >> = aDText [

	super = aDText ifFalse: [ ^ false ].
	self text ~= aDText text ifTrue: [ ^ false ].
	self xAlign ~= aDText xAlign ifTrue: [ ^ false ].
	self yAlign ~= aDText yAlign ifTrue: [ ^ false ].
	self smockFont ~= aDText smockFont ifTrue: [ ^ false ].
	
	^ true
]

{ #category : #copying }
SmockDText >> copy [

	| copy |
	copy := super copy.
	copy text: self text copy.
	copy xAlign: self text xAlign copy.
	copy yAlign: self text yAlign copy.
	copy smockFont: self smockFont copy.
	^ copy
]

{ #category : #'draw mode' }
SmockDText >> defaultDrawMode [ 

	^ #device
]

{ #category : #accessing }
SmockDText >> smockFont [

	^ smockFont
]

{ #category : #accessing }
SmockDText >> smockFont: anObject [

	smockFont := anObject
]

{ #category : #accessing }
SmockDText >> text [

	^ text
]

{ #category : #accessing }
SmockDText >> text: anObject [

	text := anObject
]
