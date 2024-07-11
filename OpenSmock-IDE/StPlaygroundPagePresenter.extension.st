Extension { #name : #StPlaygroundPagePresenter }

{ #category : #'*OpenSmock-IDE' }
StPlaygroundPagePresenter class >> baseToolbarCommands [

	^ { 
		StPlaygroundDoItCommand.
		StPlaygroundForkedDoItCommand.
		StPlaygroundCancelItCommand.
		StPlaygroundPublishCommand.
		StPlaygroundBindingsCommand.				
		StPlaygroundVersionsCommand.
		StPlaygroundPagesCommand.
	}
]
