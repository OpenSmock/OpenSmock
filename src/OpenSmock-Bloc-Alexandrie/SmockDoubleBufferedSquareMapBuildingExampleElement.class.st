"
This element displays a dynamic, grid-based map of squares using Smock’s double-buffered rendering system.

It serves as an example of how to build and update a scene incrementally in the background, while maintaining smooth rendering and responsiveness in the UI.

Responsibilities:
- Compute and display a grid of colored squares sized to fill the visible area.
- Use double buffering to preserve and update rendering content safely and efficiently.
- Simulate background rendering work via a task, updating one square at a time.

Collaborations:
- Uses SmockDoubleBufferedScene to manage buffer swapping and offscreen rendering.
- Relies on AeCanvas and AeCairoImageSurface for low-level drawing operations.
- Builds visual content using SmockGSquare2D elements.

This example is intended to demonstrate how to integrate double buffering and asynchronous model updates in a Bloc-based UI.

"
Class {
	#name : #SmockDoubleBufferedSquareMapBuildingExampleElement,
	#superclass : #BlElement,
	#instVars : [
		'squareSize',
		'lines',
		'columns',
		'squares',
		'task',
		'builderTask',
		'doubleBufferedScene',
		'mapExtent'
	],
	#category : #'OpenSmock-Bloc-Alexandrie'
}

{ #category : #drawing }
SmockDoubleBufferedSquareMapBuildingExampleElement >> aeDrawOn: aeCanvas [

	| cairoContext |
	super aeDrawOn: aeCanvas.

	"draw the scene with the double buffered stuff"
	cairoContext := aeCanvas privateAeCairoContext.

	doubleBufferedScene currentBuffer content ifNotNil: [ :e |
		cairoContext
			sourceSurface: e;
			paint ]
]

{ #category : #private }
SmockDoubleBufferedSquareMapBuildingExampleElement >> buildAndDrawModel [
	"build squares in a thread to simulate parallel processing with the render"

	| fillStyle |
	'Starting model building...' traceCr.
	
	"reset square list"
	squares := OrderedCollection new.
	fillStyle := Color random asSmockFillStyle.

	"simulate a process that is computing each square and drawing them one by one, use the double buffering stuff to display each square when ready"
	1 to: columns do: [ :x | 1 to: lines do: [ :y | | square nextBufferedCanvas cairoSurface |
		
		"prepare new buffer: setup size and draw current buffer on it to conserve current paint"
		cairoSurface := AeCairoImageSurface extent: mapExtent.
		doubleBufferedScene nextBuffer content: cairoSurface.
		nextBufferedCanvas := AeCanvas newFor: cairoSurface.
		
		"need to draw the current buffer on the next to preserve the drawing"
		doubleBufferedScene currentBuffer content ifNotNil:[ :content | | context |
			context := nextBufferedCanvas privateAeCairoContext.
			context sourceSurface: content; paint.
		].
		
		"build square at x@y"
		square := self createSquareAt: x@y fillStyle: fillStyle.
		squares add: square.
		
		"render the square on the canvas"		 
		square aeDrawOn: nextBufferedCanvas.
		
		"swap to indicate the drawing is ready to be display"
		doubleBufferedScene swap.
		
		"notify bloc to update this element"
		self invalidate.
		
		"simulate a loading processing for next square"
		50 milliSeconds wait.
	] ].

	'Model building finish!' traceCr
]

{ #category : #private }
SmockDoubleBufferedSquareMapBuildingExampleElement >> createSquareAt: aGridPosition fillStyle: fillStyle [
	"prepare new scene size"

	| square |
	"build square at x@y"
	square := SmockGSquare2D id: aGridPosition printString.
	square
		sideSize: squareSize;
		fillStyle: fillStyle;
		position: squareSize / 2 + (aGridPosition - (1 @ 1) * squareSize).

	^ square
]

{ #category : #initialization }
SmockDoubleBufferedSquareMapBuildingExampleElement >> initialize [ 
	
	super initialize.
	
	"model"
	squareSize := 256.
		
	"double buffer stuff"
	doubleBufferedScene := SmockDoubleBufferedScene new.
	
	"initial computing"
	self updateModel.
	
	self initializeListeners.
]

{ #category : #initialization }
SmockDoubleBufferedSquareMapBuildingExampleElement >> initializeListeners [

	"Add listener to compute squares when extents changed"
	self addEventHandler: (BlEventHandler
			 on: BlElementExtentChangedEvent
			 do: [ :e | self updateModel ])
]

{ #category : #dependencies }
SmockDoubleBufferedSquareMapBuildingExampleElement >> release [

	self stopBuildModel.

	super release
]

{ #category : #private }
SmockDoubleBufferedSquareMapBuildingExampleElement >> startBuildModel [
	"build squares in a thread to simulate parallel processing with the render"

	builderTask := [ self buildAndDrawModel ]
		               forkAt: Processor userBackgroundPriority
		               named: 'Building Square Model'
]

{ #category : #private }
SmockDoubleBufferedSquareMapBuildingExampleElement >> stopBuildModel [

	builderTask ifNil:[ ^ self ].
	builderTask terminate.
	builderTask := nil.
]

{ #category : #private }
SmockDoubleBufferedSquareMapBuildingExampleElement >> updateModel [

	| b |
	self stopBuildModel.
	squareSize = 0 ifTrue:[ ^ self ].
	b := self bounds.
	
	"calculate nb column to entierely fill the view"
	columns := (b width / squareSize) roundUpTo: 1.
	
	"calculate nb lines to entierely fill the view"
	lines := (b height / squareSize) roundUpTo: 1.
	
	"considere"
	mapExtent := (columns * squareSize) @ (lines * squareSize).
	
	self startBuildModel.
]
