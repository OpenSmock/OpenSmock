Class {
	#name : #SmockGShape2DViewerElement,
	#superclass : #BlElement,
	#instVars : [
		'gShapes'
	],
	#category : #'OpenSmock-Bloc'
}

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleEllipses [

	<script>
	| viewer ellipse |
	viewer := self new.

	"spyrograph like ellipses"
	(1 to: 360 by: 10) do: [ :angle |
			ellipse := SmockGEllipse2D new.
			ellipse
				rotationInDegrees: angle;
				position: 200 asPoint;
				radius1: 400;
				radius2: 10.
			ellipse strokeStyle: Color cyan asSmockStrokeStyle.
			viewer addGShape: ellipse ].

	"standard ellipse"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 0 @ 0;
		radius1: 100;
		radius2: 50.
	ellipse fillStyle: (Color red alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color red alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	"standard ellipse"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 200 @ 200;
		radius1: 100;
		radius2: 50.
	ellipse fillStyle: (Color red alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color red alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	"oriented ellipse"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 0 @ 0;
		radius1: 100;
		radius2: 50;
		rotationInDegrees: 45.
	ellipse fillStyle: (Color green alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color green alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	"oriented ellipse"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 200 @ 200;
		radius1: 100;
		radius2: 50;
		rotationInDegrees: 45.
	ellipse fillStyle: (Color green alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color green alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	"ellipse as a circle"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 0 @ 0;
		radius1: 50;
		radius2: 50.
	ellipse fillStyle: (Color blue alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color blue alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	"ellipse as a circle"
	ellipse := SmockGEllipse2D new.
	ellipse
		position: 200 asPoint;
		radius1: 50;
		radius2: 50.
	ellipse fillStyle: (Color blue alpha: 0.33) asSmockFillStyle.
	ellipse strokeStyle: (Color blue alpha: 1) asSmockStrokeStyle.
	viewer addGShape: ellipse.

	viewer openInMorphic
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleRectangles [

	<script>
	| viewer rectangle |
	viewer := self new.

	rectangle := SmockGRectangle2D new position: 50@50; length1: 50; length2: 100; strokeStyle: Color cyan asSmockStrokeStyle.
	viewer addGShape: rectangle.

	rectangle := SmockGRectangle2D new position: 150@50; length1: 100; length2: 50; fillStyle: Color cyan asSmockFillStyle.
	viewer addGShape: rectangle.

	viewer openInMorphic
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleShapesWithRadialGradient [
	<script>

	| viewer circle |
	viewer := self new.
	
	circle := SmockGCircle2D new.
	circle position: 200 asPoint; radius: 100.
	circle fillStyle: (SmockRadialGradientPaint from: Color blue to: Color red) asSmockFillStyle.
	viewer addGShape: circle.
	
	viewer openInMorphic 
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleViewer [

	<script>
	| gt gt2 gt3 gt4 bl font gt5 gt6 gt7 gt8 textPos g9 |
	bl := self new.
	
	gt := SmockGText2D new.
	textPos := 70 @ 120.
	gt text: 'Hello Smock !'.
	gt fillStyle: (SmockFillStyle paint: Color blue).
	gt xAlign: #center.
	gt yAlign: #center.
	font := SmockFont named: 'Source code pro'.
	font fontSize: 18.
	font fontSlant: #italic.
	gt smockFont: font nearestFont.
	gt position: textPos.
	bl addGShape: gt.
	
	gt2 := SmockGSquare2D new.
	gt2 position: 120 @ 40.
	gt2 fillStyle: (SmockFillStyle paint: (Color yellow alpha: 0.5)).
	gt2 strokeStyle: (SmockStrokeStyle paint: Color cyan width: 2).
	gt2 sideSize: 34.
	bl addGShape: gt2.
	
	gt3 := SmockGPolygon2D new.
	gt3 points: {
			(100 @ 0).
			(150 @ 10).
			(150 @ 60).
			(211 @ 120).
			(110 @ 110) }.
	gt3 fillStyle: (SmockFillStyle paint: (Color pink alpha: 0.2)).
	gt3 strokeStyle: (SmockStrokeStyle paint: Color black width: 1).
	bl addGShape: gt3.
		
	gt4 := SmockGBitmap2D new.
	gt4 form: (Smalltalk ui icons iconNamed: #smallInfo).
	gt4 position: 50 @ 50.
	bl addGShape: gt4.

	"polygon offcentered"
	gt5 := SmockGPolygon2D new.
	gt5 points: gt3 points copy.
	gt5 position: 10 @ 0.
	gt5 fillStyle: (SmockFillStyle paint: (Color blue alpha: 0.2)).
	gt5 strokeStyle: (SmockStrokeStyle paint: Color red width: 3).
	bl addGShape: gt5.

	"big circle"
	gt6 := SmockGCircle2D new.
	gt6 position: 133 @ 266.
	gt6 fillStyle: (Color red alpha: 0.33) asSmockFillStyle.
	gt6 strokeStyle: (Color red alpha: 1) asSmockStrokeStyle.
	gt6 radius: 130.
	bl addGShape: gt6.

	"small circle"
	gt7 := SmockGCircle2D new.
	gt7 position: textPos.
	gt7 fillStyle: (Color red alpha: 1) asSmockFillStyle.
	gt7 strokeStyle: (Color red alpha: 1) asSmockStrokeStyle.
	gt7 radius: 2.
	bl addGShape: gt7.

	"polyline"
	gt8 := SmockGPolyline2D new.
	gt8 points: gt5 points copy.
	gt8 position: 150 @ 0.
	gt8 fillStyle: (SmockFillStyle paint: (Color pink alpha: 0.2)).
	gt8 strokeStyle: (SmockStrokeStyle paint: Color pink width: 3).
	bl addGShape: gt8.

	g9 := SmockGBitmap2D new.
	g9 form: (Smalltalk ui icons iconNamed: #smallInfo).
	g9 position: 70 @ 50.
	bl addGShape: g9.

	bl openInMorphic 
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleViewerComposite [

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

	bl := SmockGShape2DViewerElement new.
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

	bl openInMorphic 
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleViewerCompositeTranslated [
	"Create a composite with two polyline, one poyline translated by the parent and one not translated by the parent"

	<script>
	| bl host composite polyline1 polyline2 |
	bl := SmockGShape2DViewerElement new.
	composite := SmockGCompositeShape2D new.
	composite position: 100@100.
	bl addGShape: composite.
	
	polyline1 := SmockGPolyline2D new.
	polyline1 
		points: { (0 @ 0). (100 @ 0). (0 @ 100) .(100 @ 100) }; 
		strokeStyle: Color blue asSmockStrokeStyle. 
	composite addChild: polyline1.
	
	polyline2 := SmockGPolyline2D new.
	polyline2 
		points: { (0 @ 0). (100 @ 0). (0 @ 100) .(100 @ 100) }; 
		isTranslatedByParent: false;
		strokeStyle: (Color blue asSmockStrokeStyle width: 3). 
	composite addChild: polyline2.
	
	bl openInMorphic 
]

{ #category : #examples }
SmockGShape2DViewerElement class >> exampleViewerForForms [

	<script>
	| gt4 bl host bitPos gt2 |
	bitPos := 200 @ 150.
	gt4 := SmockGBitmap2D new.
	gt4 form: PolymorphSystemSettings pharoLogoForm.
	gt4 fillStyle: (Color red alpha: 0.5) asSmockFillStyle.
	gt4 position: bitPos.
	gt2 := SmockGSquare2D new.
	gt2 position: bitPos.
	gt2 fillStyle: (SmockFillStyle paint: Color black).
	gt2 strokeStyle: (SmockStrokeStyle paint: Color red width: 2).
	gt2 sideSize: 2.
	bl := SmockGShape2DViewerElement new.
	bl addGShape: gt4.
	bl addGShape: gt2.

	bl openInMorphic 
]

{ #category : #accessing }
SmockGShape2DViewerElement >> addGShape: aShape [

	self gShapes add: aShape
]

{ #category : #accessing }
SmockGShape2DViewerElement >> gShapes [

	^ gShapes ifNil: [ gShapes := OrderedCollection new ]
]

{ #category : #accessing }
SmockGShape2DViewerElement >> gShapes: anObject [

	gShapes := anObject
]

{ #category : #opening }
SmockGShape2DViewerElement >> openInMorphic [

	| host |
	host := BlMorphicWindowHost new.
	BlSpace new
		in: [ :sp | sp root addChild: self ];
		host: host;
		title: host asString;
		extent: 800 @ 600;
		show
]
