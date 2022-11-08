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
			self dependencies: spec.
			"Packages"
			spec
				package: 'OpenSmock';
				package: 'OpenSmock-Tests' with: [ spec requires: #('OpenSmock') ].
		 ]
]

{ #category : #baselines }
BaselineOfOpenSmock >> dependencies: spec [

	spec baseline: 'Molecule' with: [
		spec repository: 'github://OpenSmock/Molecule' ].
]
