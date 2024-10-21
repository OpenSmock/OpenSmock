"
I'm a ""do it (forked) and inspect"" command.
I will select all contents of a playground and I will execute it, inspecting the result.
"
Class {
	#name : #StPlaygroundForkedDoItCommand,
	#superclass : #StPlaygroundCommand,
	#category : #'OpenSmock-IDE-Playground'
}

{ #category : #default }
StPlaygroundForkedDoItCommand class >> defaultDescription [

	^ 'Do it all and inspect.'
]

{ #category : #accessing }
StPlaygroundForkedDoItCommand class >> defaultIconName [

	^ #glamorousSpawn 
]

{ #category : #default }
StPlaygroundForkedDoItCommand class >> defaultName [

	^ 'Do it (T)'
]

{ #category : #accessing }
StPlaygroundForkedDoItCommand class >> order [

	^ 1
]

{ #category : #executing }
StPlaygroundForkedDoItCommand >> execute [

	| thrd |
	thrd := context application
		        propertyAt: #executionThread
		        ifAbsent: [ nil ].
	thrd ifNotNil: [ :e |
		self inform: 'Terminating previous Do-It !'.
		e terminate ].
	thrd := [
	        self context withWindowDo: [ :w |
		        w title: 'Playground - running' ].
	        context doEvaluateAllAndGo.
	        context application propertyAt: #executionThread put: nil.
	        self context withWindowDo: [ :w |
		        w title: 'Playground - finished' ] ] forkAt:
		        Processor userBackgroundPriority.
	context application propertyAt: #executionThread put: thrd
]
