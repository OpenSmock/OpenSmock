Extension { #name : #StPlaygroundPagePresenter }

{ #category : #'*OpenSmock-IDE' }
StPlaygroundPagePresenter class >> baseToolbarCommands [

	^ { 
		StPlaygroundDoItCommand.
		StPlaygroundCancelItCommand.
		StPlaygroundPublishCommand.
		StPlaygroundBindingsCommand.				
		StPlaygroundVersionsCommand.
		StPlaygroundPagesCommand.
	}
]
