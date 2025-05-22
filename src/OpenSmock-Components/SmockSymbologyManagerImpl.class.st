Class {
	#name : #SmockSymbologyManagerImpl,
	#superclass : #SmockSymbologyProvider,
	#traits : 'MolComponentImpl + SmockSymbologyManager + SmockSymbologyManagerServices',
	#classTraits : 'MolComponentImpl classTrait + SmockSymbologyManager classTrait + SmockSymbologyManagerServices classTrait',
	#category : #'OpenSmock-Components-SymbologyManager'
}

{ #category : #'services - symbology manager' }
SmockSymbologyManagerImpl >> getCurrentSymbology [

	^ super getCurrentSymbology
]

{ #category : #'services - symbology manager' }
SmockSymbologyManagerImpl >> getCurrentSymbologyKey [

	^ super getCurrentSymbologyKey
]

{ #category : #'component accessing' }
SmockSymbologyManagerImpl >> getSmockSymbologyManagerEventsNotifier [
	^self eventsNotifiers at: SmockSymbologyManagerEvents ifAbsent: [^MolNotFoundEventsNotifier new interface: SmockSymbologyManagerEvents name: nil].
]

{ #category : #'services - symbology manager' }
SmockSymbologyManagerImpl >> getSymbol: aSymbolKey [

	^ super getSymbol: aSymbolKey
]

{ #category : #'services - symbology manager' }
SmockSymbologyManagerImpl >> setCurrentSymbology: aSymbologyKey [

	super setCurrentSymbology: aSymbologyKey.
	self getSmockSymbologyManagerEventsNotifier symbologyHasChanged: aSymbologyKey
]
