"
""This class manages a simple double-buffering mechanism for graphical rendering

It maintains two internal scene buffers and provides an API to alternate between them. One buffer is used for display (`currentBuffer`) while the other is used for off-screen drawing (`nextBuffer`). Once drawing is complete, the buffers are swapped using `swap`.

Responsibilities:
- Initialize and manage two scene buffers.
- Provide access to the current and next buffers.
- Swap buffers when rendering is complete to ensure smooth updates.

Collaborations:
- Uses instances of SmockSceneBuffer to hold rendering content.
- Designed to be used in conjunction with visual elements that update incrementally or asynchronously.

Usage:
	... initialize ...
	scene := SmockDoubleBufferedScene new.
	... prepare drawing on nextBuffer ...
	canvas := scene nextBuffer content: newImageSurface.
	... draw on canvas ...
	... swap when ready to display ...
	scene swap.

"
Class {
	#name : #SmockDoubleBufferedScene,
	#superclass : #Object,
	#instVars : [
		'currentBuffer',
		'nextBuffer'
	],
	#category : #'OpenSmock-Buffer'
}

{ #category : #API }
SmockDoubleBufferedScene >> currentBuffer [

	^ currentBuffer
]

{ #category : #initialization }
SmockDoubleBufferedScene >> initialize [

	super initialize.
	self initializeCurrentBuffer.
	self initializeNextBuffer
]

{ #category : #initialization }
SmockDoubleBufferedScene >> initializeCurrentBuffer [

	currentBuffer := SmockSceneBuffer new name: 'Scene 1'
]

{ #category : #initialization }
SmockDoubleBufferedScene >> initializeNextBuffer [

	nextBuffer := SmockSceneBuffer new name: 'Scene 2'
]

{ #category : #API }
SmockDoubleBufferedScene >> nextBuffer [

	^ nextBuffer
]

{ #category : #API }
SmockDoubleBufferedScene >> swap [

	| temp |
	temp := currentBuffer.
	currentBuffer := nextBuffer.
	nextBuffer := temp
]
