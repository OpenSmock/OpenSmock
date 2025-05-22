"
This require as input :
- a key from this Symbology 
- a dictionary key / filepath for symbol definition 
"
Class {
	#name : #SmockSymbologyProvider,
	#superclass : #Object,
	#instVars : [
		'currentSymbology'
	],
	#classVars : [
		'symbologyTable'
	],
	#category : #'OpenSmock-Symbology'
}

{ #category : #symbologies }
SmockSymbologyProvider class >> addSymbol: aSymbolKey image: aSymbolForm symbology: aSymbologyKey [
	"This require as input :
- a key for this Symbology 
- a key for the Symbol
- a Form for symbol definition"

	"Create dictionary for key / symbol for this new Symbology is needed"

	| symbology |
	
	aSymbolForm ifNil:[ ^ self ].
	aSymbolKey ifNil:[ ^ self ].
	
	symbology := (self getOrInitializeSymbology: aSymbologyKey) ifNil:[ ^ self ].

	"Add the new Symbol"
	symbology at: aSymbolKey put: aSymbolForm
]

{ #category : #symbologies }
SmockSymbologyProvider class >> addSymbology: aSymbology [

	aSymbology ifNil: [ ^ self ].
	aSymbology key ifNil: [ ^ self ].

	self symbologyTable at: (aSymbology key) put: aSymbology
]

{ #category : #symbologies }
SmockSymbologyProvider class >> availableSymbologies [

	^ self symbologyTable keys
]

{ #category : #cleanup }
SmockSymbologyProvider class >> cleanUp [

	self cleanUpSymbologies
]

{ #category : #cleanup }
SmockSymbologyProvider class >> cleanUpSymbologies [

	<script>
	symbologyTable := nil
]

{ #category : #private }
SmockSymbologyProvider class >> getOrInitializeSymbology: aSymbologyKey [

	| symbology |
	aSymbologyKey ifNil: [ ^ nil ].
	symbology := self getSymbology: aSymbologyKey.
	symbology ifNil: [
		symbology := SmockSymbology new key: aSymbologyKey.
		self addSymbology: symbology ].

	^ symbology
]

{ #category : #symbologies }
SmockSymbologyProvider class >> getSymbol: aSymbolKey symbology: aSymbologyKey [

	| dict |
	aSymbolKey ifNil:[ ^ nil ].
	dict := (self getSymbology: aSymbologyKey) ifNil: [ ^ nil ].
	^ dict at: aSymbolKey ifAbsent:[ nil ]
]

{ #category : #symbologies }
SmockSymbologyProvider class >> getSymbology: aSymbologyKey [

	^ self symbologyTable at: aSymbologyKey ifAbsent: [ ^ nil ]
]

{ #category : #symbologies }
SmockSymbologyProvider class >> removeSymbol: aSymbolKey symbology: aSymbologyKey [

	| dict |
	aSymbolKey ifNil:[ ^ self ].
	dict := (self getSymbology: aSymbologyKey) ifNil: [ ^ self ].
	dict removeKey: aSymbolKey
]

{ #category : #symbologies }
SmockSymbologyProvider class >> removeSymbology: aSymbologyKey [

	aSymbologyKey ifNil:[ ^ self ].
	self symbologyTable removeKey: aSymbologyKey ifAbsent: [ ^ self ]
]

{ #category : #symbologies }
SmockSymbologyProvider class >> symbologyTable [

	<script: 'self symbologyTable inspect'>
	^ symbologyTable ifNil: [ symbologyTable := Dictionary new ]
]

{ #category : #'services - symbology manager' }
SmockSymbologyProvider >> getCurrentSymbology [

	currentSymbology ifNil: [ "Try to setup a default symbology"
		self class availableSymbologies notEmpty ifTrue: [
			self setCurrentSymbology: self class availableSymbologies first ] ].

	^ currentSymbology
]

{ #category : #'services - symbology manager' }
SmockSymbologyProvider >> getCurrentSymbologyKey [

	| current |
	current := self getCurrentSymbology ifNil: [ ^ nil ].
	self class symbologyTable keysAndValuesDo: [ :k :v |
		v = current ifTrue: [ ^ k ] ].
	^ nil
]

{ #category : #access }
SmockSymbologyProvider >> getDefaultSymbolFor: aSymbology [

	^ aSymbology at: #default ifAbsent: [ nil ]
]

{ #category : #access }
SmockSymbologyProvider >> getSymbol: aSymbolKey [

	aSymbolKey ifNil: [ ^ nil ].
	^ self getCurrentSymbology ifNotNil: [ :e |
		  e at: aSymbolKey ifAbsent: [ self getDefaultSymbolFor: e ] ]
]

{ #category : #access }
SmockSymbologyProvider >> setCurrentSymbology: aKey [

	| newSymbology |
	aKey ifNil: [ ^ self ].

	newSymbology := symbologyTable at: aKey ifAbsent: [ nil ].
	newSymbology ifNil: [ ^ self ].

	currentSymbology := newSymbology
]
