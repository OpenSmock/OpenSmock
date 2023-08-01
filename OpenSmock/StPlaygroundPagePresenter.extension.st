Extension { #name : #StPlaygroundPagePresenter }

{ #category : #'*OpenSmock' }
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
