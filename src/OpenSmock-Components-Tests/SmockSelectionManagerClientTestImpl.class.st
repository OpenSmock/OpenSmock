Class {
	#name : #SmockSelectionManagerClientTestImpl,
	#superclass : #MolAbstractComponentImpl,
	#traits : 'SmockSelectionManagerClientTest + SmockSelectionManagerEvents',
	#classTraits : 'SmockSelectionManagerClientTest classTrait + SmockSelectionManagerEvents classTrait',
	#instVars : [
		'selection'
	],
	#category : #'OpenSmock-Components-Tests'
}

{ #category : #'component accessing' }
SmockSelectionManagerClientTestImpl >> getSmockSelectionManagerEventsSubscriber [
	| eventsSymbol eventsSubscriber itf |
	itf := SmockSelectionManagerEvents.
	eventsSymbol := self eventsSubscribers at: itf ifAbsent: [^MolNotFoundEventsSubscriber new interface: itf name: nil].
	eventsSymbol isCollection
	 	ifTrue: 
			[eventsSubscriber := MolComponentManager default locatorServices 
						searchEventsSubscriberFor: SmockSelectionManagerEvents named: eventsSymbol ]. 
	^eventsSubscriber
]

{ #category : #'component accessing' }
SmockSelectionManagerClientTestImpl >> getSmockSelectionManagerServicesProvider [
	| servicesSymbol servicesProvider itf |

	itf := SmockSelectionManagerServices.
	servicesSymbol := self servicesProviders at: itf ifAbsent: [nil].
	(servicesSymbol isNil or:[servicesSymbol isSymbol not]) ifTrue: [ ^ MolNotFoundServicesProvider new interface: itf name: nil ].

	servicesProvider := MolComponentManager default locatorServices searchServicesProviderFor: SmockSelectionManagerServices named: servicesSymbol.
	^servicesProvider
]

{ #category : #accessing }
SmockSelectionManagerClientTestImpl >> selection [

	^ selection
]

{ #category : #'events - selection manager' }
SmockSelectionManagerClientTestImpl >> selectionHasChanged: aSmockSelection [

	selection := aSmockSelection
]
