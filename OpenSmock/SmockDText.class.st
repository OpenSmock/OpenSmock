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
		'smockFont',
		'coordinatesDeviceOffset'
	],
	#category : #'OpenSmock-DShape'
}

{ #category : #accessing }
SmockDText >> coordinatesDeviceOffset [

	^ coordinatesDeviceOffset
]

{ #category : #accessing }
SmockDText >> coordinatesDeviceOffset: anObject [

	coordinatesDeviceOffset := anObject
]

{ #category : #copying }
SmockDText >> copy [
	| copy |
	copy := super copy.
	copy text: self text copy.
	copy smockFont: self smockFont copy.
	copy coordinatesDeviceOffset: self coordinatesDeviceOffset.
	^copy
]

{ #category : #accessing }
SmockDText >> fontEmphasis [

	self deprecated:'use smockFont'.
	^ fontEmphasis
]

{ #category : #accessing }
SmockDText >> fontEmphasis: anObject [

	self deprecated:'use smockFont'.
	fontEmphasis := anObject 
]

{ #category : #accessing }
SmockDText >> fontName [

	self deprecated:'use smockFont'.
	^ fontName
]

{ #category : #accessing }
SmockDText >> fontName: anObject [

	self deprecated:'use smockFont'.
	fontName := anObject
]

{ #category : #accessing }
SmockDText >> fontSize [

	self deprecated:'use smockFont'.
	^ fontSize
]

{ #category : #accessing }
SmockDText >> fontSize: anObject [

	self deprecated:'use smockFont'.
	fontSize := anObject
]

{ #category : #accessing }
SmockDText >> fontWeight [

	self deprecated:'use smockFont'.
	^ fontWeight
]

{ #category : #accessing }
SmockDText >> fontWeight: anObject [

	self deprecated:'use smockFont'.
	fontWeight := anObject 
]

{ #category : #accessing }
SmockDText >> initialize [

	super initialize.
	drawMode := #user
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
