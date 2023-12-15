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
	| gt gt2 gt3 gt4 bl host |
	gt := SmockGText2D new.
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
	gt3 fillStyle: (SmockFillStyle paint: (Color pink alpha: 0.2)).
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
		show.

]

{ #category : #accessing }
BlSmockGShapeViewer >> addGShape: aShape [

	^ self gShapes add: aShape
]

{ #category : #drawing }
BlSmockGShapeViewer >> aeDrawOn: aeCanvas [

super aeDrawOn: aeCanvas.
self gShapes do: [ :s | s aeDrawOn: aeCanvas ].
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
