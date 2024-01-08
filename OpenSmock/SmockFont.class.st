Class {
	#name : #SmockFont,
	#superclass : #Object,
	#instVars : [
		'fontName',
		'fontSlant',
		'fontWeight',
		'fontSize',
		'fontStretch',
		'cachedFont',
		'cachedFontFace'
	],
	#category : #'OpenSmock-Core'
}

{ #category : #'instance creation' }
SmockFont class >> allFontNames [
^SmockFontManager fontList
]

{ #category : #defaults }
SmockFont class >> defaultFontSize [ 
^10
]

{ #category : #'instance creation' }
SmockFont class >> fromFontFace: aFontFace [

| tmp |
tmp := self new.
tmp fontName: aFontFace familyName. 
tmp fontWeight: aFontFace weight name.
tmp fontSlant: aFontFace slant name.
tmp fontStretch: aFontFace stretch name.
tmp detectFont.
^tmp

]

{ #category : #'instance creation' }
SmockFont class >> named: aString [
| tmp |
tmp := self new.
tmp fontName: aString.
tmp detectFont.
tmp fontSize: self defaultFontSize.
^tmp
]

{ #category : #converting }
SmockFont >> asScaledFont [

	^ self asScaledFont: self fontSize
]

{ #category : #converting }
SmockFont >> asScaledFont: aSize [

	| sf |
	sf := SmockScaledFont new.
	sf fontDescription: self.
	sf height: aSize.
	sf computeScaledFont.
	^sf.
	
	
]

{ #category : #testing }
SmockFont >> cachedFont [

	cachedFont isNil ifTrue: [ self detectFont ].
	^ cachedFont
]

{ #category : #testing }
SmockFont >> cachedFontFace [

	cachedFontFace isNil ifTrue: [ self detectFont ].
	^cachedFontFace 
]

{ #category : #testing }
SmockFont >> detectFont [

	cachedFontFace := SmockFontManager detectFont: self.
	cachedFontFace ifNotNil: [ cachedFont := self asScaledFont ].
]

{ #category : #testing }
SmockFont >> distanceFromFaceEntry: aFaceEntry [
| distance |
distance := 0.

distance := distance + ((aFaceEntry slant value - (AeFontSlant perform: self fontSlant) value) *100) abs.
distance := distance + (aFaceEntry weight value - (AeFontWeight perform: self fontWeight) value) abs.
distance := distance + (aFaceEntry stretch value - (AeFontStretch perform: self fontStretch) value) abs.

^distance
]

{ #category : #testing }
SmockFont >> exists [

	^ self cachedFontFace isNil not
]

{ #category : #accessing }
SmockFont >> fontName [

	^ fontName
]

{ #category : #accessing }
SmockFont >> fontName: anObject [

	self resetCache.
	fontName := anObject
]

{ #category : #accessing }
SmockFont >> fontSize [

	^ fontSize ifNil: [ fontSize := 10 ]
]

{ #category : #accessing }
SmockFont >> fontSize: anObject [

	fontSize := anObject.
	self cachedFontFace ifNotNil:[
	cachedFont := self asScaledFont ].
]

{ #category : #accessing }
SmockFont >> fontSlant [

	^ fontSlant ifNil: [ fontSlant := #normal ]
]

{ #category : #accessing }
SmockFont >> fontSlant: anObject [

	self resetCache.
	fontSlant := anObject
]

{ #category : #accessing }
SmockFont >> fontStretch [

	^ fontStretch ifNil: [ fontStretch := #normal ]
]

{ #category : #accessing }
SmockFont >> fontStretch: anObject [

	self resetCache.
	fontStretch := anObject
]

{ #category : #accessing }
SmockFont >> fontWeight [

	^ fontWeight ifNil: [ fontWeight := #normal ]
]

{ #category : #accessing }
SmockFont >> fontWeight: anObject [

	self resetCache.
	fontWeight := anObject
]

{ #category : #testing }
SmockFont >> getFamilyFonts [
| list |
list := self getFamilyList.
list := list collect:[ :e | self class fromFontFace: e].
^list.
]

{ #category : #testing }
SmockFont >> getFamilyList [
| list |
list := AeFontManager globalInstance faceEntries select:[:e | e familyName asLowercase = self fontName asLowercase ].
list := list asSortedCollection: [ :fe :fe2 | (self distanceFromFaceEntry: fe) < (self distanceFromFaceEntry: fe2)]. 
^list
]

{ #category : #testing }
SmockFont >> nearestFont [
| family |
self exists ifTrue: [ ^self ].
family := self getFamilyList.
family isEmpty ifTrue:[^nil].
^self class fromFontFace: family first. 

]

{ #category : #printing }
SmockFont >> printOn: aStream [
aStream nextPutAll: 'SmockFont<'.
self fontName printOn: aStream.
aStream nextPutAll: '; sl: '.
self fontSlant printOn: aStream.
aStream nextPutAll: '; w: '.
self fontWeight  printOn: aStream.
aStream nextPutAll: '; str: '.
self fontStretch printOn: aStream.
aStream nextPutAll: '>'.
]

{ #category : #accessing }
SmockFont >> resetCache [
		cachedFont := nil.
	cachedFontFace := nil.
]
