Class {
	#name : #BaselineOfOpenSmock,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenSmock
}

{ #category : #baselines }
BaselineOfOpenSmock >> baseline: spec [

	<baseline>
	"Common baseline for all Pharo versions"
	spec for: #common do: [ self baselineForCommon: spec ]
]

{ #category : #baselines }
BaselineOfOpenSmock >> baselineForCommon: spec [
	<baseline>
	
	spec preLoadDoIt: #'preload:package:'.
	spec postLoadDoIt: #'postload:package:'.
		
	"Dependencies"
	self coreDependencies: spec.
	self fullDependencies: spec.

	"Packages"
	self corePackages: spec.
	self idePackages: spec.
	
	"Groups"
	spec group: 'default' with: #('Core' 'Full'). "complete version"
	spec group: 'Core' with: self corePackagesNames. "only core"
	spec group: 'Full' with: self fullPackagesNames. "all"

]

{ #category : #dependencies }
BaselineOfOpenSmock >> coreDependencies: spec [

	"Molecule component framework"
	spec baseline: 'Molecule' with: [	spec repository: 'github://OpenSmock/Molecule' ].
]

{ #category : #packages }
BaselineOfOpenSmock >> corePackages: spec [

	spec
		package: 'OpenSmock' with:[ spec requires: #('Molecule') ].
		
	"Tests packages"
	spec
		package: 'OpenSmock-Tests' with: [ spec requires: #('OpenSmock') ].
]

{ #category : #packages }
BaselineOfOpenSmock >> corePackagesNames [

	^ #(
	'OpenSmock'
	'OpenSmock-Tests'
	)

]

{ #category : #dependencies }
BaselineOfOpenSmock >> fullDependencies: spec [

	"OSWindows extensions (+ OS-Windows)"
	spec baseline: 'OSWindowsOpenSmock' with: [	spec repository: 'github://OpenSmock/OS-Windows:main' ].

	"OS-Unix"
	spec baseline: 'OSUnix' with: [	spec repository: 'github://astares/Pharo-OS-Unix/src' ].
	
	"Iconography"
	spec baseline: 'OpenSmockIconography' with: [	spec repository: 'github://OpenSmock/Iconography:main' ].
]

{ #category : #packages }
BaselineOfOpenSmock >> fullPackagesNames [ 

	^ self corePackagesNames, #(
	'OpenSmock-IDE'
	)

]

{ #category : #packages }
BaselineOfOpenSmock >> idePackages: spec [

	spec
		package: 'OpenSmock-IDE' with: [ spec requires: #('OpenSmock') ].
		
	"Tests packages"
	"No packages"
]

{ #category : #baselines }
BaselineOfOpenSmock >> postload: loader package: packageSpec [

	"do nothing"
]

{ #category : #baselines }
BaselineOfOpenSmock >> preload: loader package: packageSpec [

	"do nothing"
]
