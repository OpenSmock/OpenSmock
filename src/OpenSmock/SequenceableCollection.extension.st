Extension { #name : #SequenceableCollection }

{ #category : #'*OpenSmock' }
SequenceableCollection >> combineSubCollections [

	| combinations |
	combinations := self first asOrderedCollection.
	self allButFirst do: [ :list |
		combinations := (combinations flatCollect: [ :element |
			                 list collect: [ :value |
				                 (element isCollection
					                  ifTrue: [ element asArray ]
					                  ifFalse: [ Array with: element ]) , { value } ] ])
			                asOrderedCollection ].
	^combinations
]
