"
This class represents a single buffer in a double-buffered rendering system.

Each buffer stores a piece of rendering content (such as an off-screen image surface), along with an optional name for identification or debugging purposes.

Responsibilities:
- Store a rendering surface or drawing content.
- Allow the content to be updated, retrieved, or cleared.

Collaborations:
- Used by SmockDoubleBufferedScene to manage alternating rendering buffers.

Typical usage:
	buffer := SmockSceneBuffer new.
	buffer content: someDrawingBackendSurface (.i.e a CairoImageSurface if using Alexandrie with Cairo)
"
Class {
	#name : #SmockSceneBuffer,
	#superclass : #Object,
	#instVars : [
		'name',
		'content'
	],
	#category : #'OpenSmock-Buffer'
}

{ #category : #API }
SmockSceneBuffer >> clear [

	content := nil
]

{ #category : #API }
SmockSceneBuffer >> content [

	^ content
]

{ #category : #accessing }
SmockSceneBuffer >> content: anObject [

	content := anObject
]

{ #category : #accessing }
SmockSceneBuffer >> name [

	^ name
]

{ #category : #accessing }
SmockSceneBuffer >> name: anObject [

	name := anObject
]
