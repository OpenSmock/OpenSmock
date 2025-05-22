"
Factorisation of DCompositeShape children management
"
Trait {
	#name : #TSmockDCompositeShapeProcessData,
	#category : #'OpenSmock-DShape'
}

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> createAndAddGChildFrom: aDShape inGComposite: aGComposite2D [

	| processData gShape2D |
	
	"Not add no keyed dShape"
	aDShape key ifNil:[ ^ self ].
	self processor ifNil:[ ^ self ].
	
	processData := (self processor getProcessDataFor: aDShape) ifNil:[ ^ self ].
	self processor isRecyclingActive ifTrue:[
		gShape2D := self processor destockRecycledDataFor: aDShape class.
		gShape2D ifNotNil: [ :e | gShape2D := processData processRecycledData: aDShape key incoming: gShape2D with: e context: nil ].
	].

	gShape2D := processData processCreatedData: aDShape key incoming: aDShape with: gShape2D context: nil.
	gShape2D ifNotNil:[
		aGComposite2D addChild: gShape2D.
	].
	
]

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> processCreatedDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [
	"Sort the list before create GShape to manage zOrder"

	aDCompositeShape hasChildren ifFalse:[ ^ self  ].
	
	aDCompositeShape sortChildrenBy: [ :a :b | a zIndex < b zIndex ].

	aDCompositeShape dShapeList do: [ :dShape |
		self createAndAddGChildFrom: dShape inGComposite: aGCompositeShape2D ]
]

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> processRecycledDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [
	
	aGCompositeShape2D removeChildren.
]

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> processUpdatedDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [

	"new children was added"
	aDCompositeShape numberOfChildren > aGCompositeShape2D numberOfChildren ifTrue:[
		
		"Sort the list before create GShape to manage zOrder"
		aDCompositeShape sortChildrenBy: [ :a :b | a zIndex < b zIndex ]. 
		
		aDCompositeShape dShapeList do:[ :dShape | | gChild |
			"cannot manage no keyed dShape"
			dShape key ifNotNil:[
				gChild := aGCompositeShape2D getChild: dShape key.
				gChild ifNil:[ self createAndAddGChildFrom: dShape inGComposite: aGCompositeShape2D ].
			].
		].
	].
	
	aDCompositeShape hasDirtyChildren ifTrue:[ 

		"Sort the list before updated GShape to manage zOrder"
		aDCompositeShape sortChildrenBy: [ :a :b | a zIndex < b zIndex ].

		"check for updated children"
		aDCompositeShape toUpdateDShapeList do:[ :dShape | | processData gChild |
			"cannot manage no keyed dShape"
			dShape key ifNotNil:[
				gChild := aGCompositeShape2D getChild: dShape key.
				gChild ifNotNil:[
					processData := self processor getProcessDataFor: dShape.
					processData processUpdatedData: dShape key incoming: dShape with: gChild context: aContext.
				].
			].
		].
	
		"check for remove children"
		aDCompositeShape toDeleteDShapeList do:[ :dShape | | gChild |
			"cannot manage no keyed dShape"
			dShape key ifNotNil:[
				gChild := aGCompositeShape2D getChild: dShape key.
				gChild ifNil:[
					"add the new dShape"
					self removeGChild: gChild createdFrom: dShape offGComposite: aGCompositeShape2D.
				].
			].
		].
	
		aDCompositeShape clearChangedDShapeLists.
		aDCompositeShape updateStateWithChildren.
	].
	
	self processUserProjectionChangedDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext.
	
	^ aGCompositeShape2D 
]

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> processUserProjectionChangedDComposite: aKey incoming: aDCompositeShape with: aGCompositeShape2D context: aContext [
	
	aDCompositeShape hasUserComputing ifFalse:[ ^ self ].
	
	aDCompositeShape dShapeList do:[ :dShape | | processData gShape |
		
		"cannot manage no keyed dShape"
		(dShape hasUserComputing and:[ dShape key notNil ]) ifTrue:[
			gShape := aGCompositeShape2D getChild: dShape key.
			gShape ifNotNil:[ :e |
				processData := self processor getProcessDataFor: dShape.
				processData processUpdatedData: dShape key incoming: dShape with: e context: nil.
			].
		].			
				
	].

	^ aGCompositeShape2D 
]

{ #category : #'processing - dcomposite' }
TSmockDCompositeShapeProcessData >> removeGChild: aGShape2D createdFrom: aDShape offGComposite: aGComposite2D [

	| processData gChild |

	"Not remove no keyed dShape"
	aDShape key ifNil:[ ^ self ].

	processData := self processor getProcessDataFor: aDShape.
	gChild := processData processDeletedData: aDShape key incoming: aDShape with: aGShape2D context: nil.
	gChild ifNotNil:[
		aGComposite2D removeChild: aDShape key.
		self processor isRecyclingActive ifTrue:[self processor stockRecycledData: gChild for: aDShape class].
	].
]
