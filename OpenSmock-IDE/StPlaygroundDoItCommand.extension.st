Extension { #name : #StPlaygroundDoItCommand }

{ #category : #'*OpenSmock-IDE' }
StPlaygroundDoItCommand >> execute [

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
