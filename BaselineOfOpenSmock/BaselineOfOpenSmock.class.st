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

	"Molecule component framework"
	spec baseline: 'Molecule' with: [	spec repository: 'github://OpenSmock/Molecule' ].

	"OSWindows extensions (+ OS-Windows)"
	spec baseline: 'OSWindowsOpenSmock' with: [	spec repository: 'github://OpenSmock/OS-Windows:main' ].

	"OS-Unix"
	spec baseline: 'OSUnix' with: [	spec repository: 'github://astares/Pharo-OS-Unix/src' ].
	
	"Iconography"
	spec baseline: 'OpenSmockIconography' with: [	spec repository: 'github://OpenSmock/Iconography:main' ].
]
