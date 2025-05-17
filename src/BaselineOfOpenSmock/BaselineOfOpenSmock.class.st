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
	self blocDependencies: spec.
	self moleculeDependencies: spec.

	"Packages"
	self corePackages: spec.
	self blocPackages: spec.
	self moleculePackages: spec.
	self idePackages: spec.
	
	"Groups"
	spec group: 'default' with: (self corePackagesNames, self blocPackagesNames, self moleculePackagesNames, self idePackagesNames). "complete version"
	spec group: 'Core' with: self corePackagesNames.
	spec group: 'CoreWithBloc' with: (self corePackagesNames, self blocPackagesNames).

]

{ #category : #dependencies }
BaselineOfOpenSmock >> blocDependencies: spec [

	spec
		baseline: 'Alexandrie'
		with: [ spec repository: 'github://pharo-graphics/Alexandrie:master/src' ].

	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://pharo-graphics/Bloc:master/src' ]
]

{ #category : #packages }
BaselineOfOpenSmock >> blocPackages: spec [

	spec
		package: 'OpenSmock-Bloc' with: [ spec requires: #('OpenSmock' 'Bloc') ];
		package: 'OpenSmock-Alexandrie' with: [ spec requires: #('OpenSmock' 'Alexandrie') ];
		package: 'OpenSmock-Bloc-Alexandrie' with: [ spec requires: #('OpenSmock' 'Alexandrie' 'Bloc') ]
]

{ #category : #packages }
BaselineOfOpenSmock >> blocPackagesNames [

	^ #(
	'OpenSmock-Alexandrie'
	'OpenSmock-Bloc'
	'OpenSmock-Bloc-Alexandrie'
	)

]

{ #category : #packages }
BaselineOfOpenSmock >> corePackages: spec [

	spec package: 'OpenSmock'.

	"Tests packages"
	spec
		package: 'OpenSmock-Tests'
		with: [ spec requires: #( 'OpenSmock' ) ]
]

{ #category : #packages }
BaselineOfOpenSmock >> corePackagesNames [

	^ #(
	'OpenSmock'
	'OpenSmock-Tests'
	)

]

{ #category : #packages }
BaselineOfOpenSmock >> idePackages: spec [

	spec
		package: 'OpenSmock-IDE' with: [ spec requires: #('OpenSmock') ]
]

{ #category : #packages }
BaselineOfOpenSmock >> idePackagesNames [ 

	^ #(
		'OpenSmock-IDE'
	)

]

{ #category : #dependencies }
BaselineOfOpenSmock >> moleculeDependencies: spec [
	"Dependencies using Molecule component framework"

	spec
		baseline: 'Molecule'
		with: [ spec repository: 'github://OpenSmock/Molecule:main/src' ]
]

{ #category : #packages }
BaselineOfOpenSmock >> moleculePackages: spec [

	spec
		package: 'OpenSmock-Components'
		with: [ spec requires: #( 'Molecule' ) ].

	spec
		package: 'OpenSmock-Components-Tests'
		with: [ spec requires: #( 'OpenSmock-Components' ) ]
]

{ #category : #packages }
BaselineOfOpenSmock >> moleculePackagesNames [

	^ #(
	'OpenSmock-Components'
	'OpenSmock-Components-Tests'
	)

]

{ #category : #baselines }
BaselineOfOpenSmock >> postload: loader package: packageSpec [

	"do nothing"
]

{ #category : #baselines }
BaselineOfOpenSmock >> preload: loader package: packageSpec [

	"do nothing"
]
