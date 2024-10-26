"
I'm a ""cancel of do it and inspect"" command.
I will cancel current playground execution when possible...
"
Class {
	#name : #StPlaygroundCancelItCommand,
	#superclass : #StPlaygroundCommand,
	#category : #'OpenSmock-IDE-Playground'
}

{ #category : #default }
StPlaygroundCancelItCommand class >> defaultDescription [

	^ 'Cancel current do it'
]

{ #category : #accessing }
StPlaygroundCancelItCommand class >> defaultIconName [

	^ #glamorousCancel
]

{ #category : #default }
StPlaygroundCancelItCommand class >> defaultName [

	^ 'Cancel it'
]

{ #category : #accessing }
StPlaygroundCancelItCommand class >> order [

	^ 2
]

{ #category : #executing }
StPlaygroundCancelItCommand >> execute [ 
	| thrd tmp |
	thrd := context application propertyAt: #executionThread ifAbsent:[nil].
	thrd ifNil:[ self inform:'No pending "Do it" !' ] ifNotNil: [ :e |
		 e terminate.
		self inform: 'Previous Do-It Cancelled !'.
		context application propertyAt: #executionThread put: nil.
		 ].
	self context withWindowDo: [ :w | tmp := w title: 'Playground - stopped' ].

]
