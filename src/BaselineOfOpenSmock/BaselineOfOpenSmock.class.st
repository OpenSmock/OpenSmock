Class {
	#name : #BaselineOfOpenSmock,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenSmock
}

{ #category : #baselines }
BaselineOfOpenSmock >> baseline: spec [
	<baseline> 
	spec
		for: #common
		do: [			
			"Packages"
			spec
				package: 'OpenSmock';
				package: 'OpenSmock-Tests' with: [ spec requires: #('OpenSmock') ].
		 ]
]
