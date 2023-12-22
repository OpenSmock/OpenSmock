Class {
	#name : #BlSmockGShapeViewer,
	#superclass : #BlElement,
	#instVars : [
		'gShapes'
	],
	#category : #'OpenSmock-Bloc-Alexandrie'
}

{ #category : #tests }
BlSmockGShapeViewer class >> testViewer [

	<script>
	| gt gt2 gt3 gt4 bl host font |
	gt := SmockGText2D new.
	gt text: 'Hello UX !'.
	gt fillStyle: (SmockFillStyle paint: Color black).
	font := SmockFont named: 'Source code pro'.
	gt smockFont: font nearestFont.
	gt position: 20 @ 20.
	gt2 := SmockGSquare2D new.
	gt2 position: 120 @ 40.
	gt2 fillStyle: (SmockFillStyle paint: (Color yellow alpha: 0.5)).
	gt2 strokeStyle: (SmockStrokeStyle paint: Color cyan width: 2).
	gt2 sideSize: 34.
	gt3 := SmockGPolygon2D new.
	gt3 points: {
			(100 @ 0).
			(150 @ 10).
			(150 @ 60).
			(211 @ 120).
			(110 @ 110) }.
	"gt3 fillStyle: (SmockFillStyle paint: (Color pink alpha: 0.2))."
	gt3 strokeStyle: (SmockStrokeStyle paint: Color black width: 1).
	gt4 := SmockGBitmap2D new.
	gt4 form: (Smalltalk ui icons iconNamed: #smallInfo).
	gt4 position: 50 @ 50.


	bl := BlSmockGShapeViewer new.
	bl addGShape: gt.
	bl addGShape: gt2.
	bl addGShape: gt3.
	bl addGShape: gt4.

	host := BlMorphicWindowHost new.
	BlSpace new
		in: [ :sp | sp root addChild: bl ];
		host: host;
		title: host asString;
		extent: 200 asPoint;
		show
]

{ #category : #tests }
BlSmockGShapeViewer class >> testViewerComposite [

	<script>
	| gt gt2 gc gc2 bl host line1 line2 |
	gc := SmockGCompositeShape2D new.
	gc position: 100 @ 100.
	gc2 := SmockGCompositeShape2D new.
	gc2 position: 150 @ 150.
	line1 := SmockGPolyline2D new.
	line2 := SmockGPolyline2D new.
	line1 position: 0 @ 0.
	line2 position: 0 @ 0.
	line1 points: {
			(0 @ 100).
			(100 @ 100).
			(100 @ 0) }.
	line1 strokeStyle: (SmockStrokeStyle paint: Color red width: 1).
	line2 points: {
			(0 @ 150).
			(150 @ 150).
			(150 @ 0) }.
	line2 strokeStyle: (SmockStrokeStyle paint: Color red width: 1).

	bl := BlSmockGShapeViewer new.
	bl addGShape: gc.
	bl addGShape: gc2.
	bl addGShape: line1.
	bl addGShape: line2.

	gt := SmockGSquare2D new.
	gt position: 10 @ 20.
	gt fillStyle: (SmockFillStyle paint: (Color blue)).
	gt strokeStyle: (SmockStrokeStyle paint: Color green width: 2).
	gt sideSize: 5.
	gt2 := SmockGSquare2D new.
	gt2 position: 0 @ 0.
	gt2 fillStyle: (SmockFillStyle paint: (Color pink)).
	gt2 strokeStyle: (SmockStrokeStyle paint: Color cyan width: 2).
	gt2 sideSize: 10.

	gc addChild: gt.
	gc addChild: gt2.

	gc2 addChild: gt.
	gc2 addChild: gt2.

	host := BlMorphicWindowHost new.
	BlSpace new
		in: [ :sp | sp root addChild: bl ];
		host: host;
		title: host asString;
		extent: 400 asPoint;
		show
]

{ #category : #accessing }
BlSmockGShapeViewer >> addGShape: aShape [

	^ self gShapes add: aShape
]

{ #category : #drawing }
BlSmockGShapeViewer >> aeDrawOn: aeCanvas [

	super aeDrawOn: aeCanvas.
	self gShapes do: [ :s | s aeDrawOn: aeCanvas ]
]

{ #category : #accessing }
BlSmockGShapeViewer >> clearGShapes [
	^ self gShape removeAll.
]

{ #category : #accessing }
BlSmockGShapeViewer >> gShapes [

	^ gShapes ifNil:[ gShapes := OrderedCollection new].
]

{ #category : #accessing }
BlSmockGShapeViewer >> gShapes: anObject [

	gShapes := anObject
]
