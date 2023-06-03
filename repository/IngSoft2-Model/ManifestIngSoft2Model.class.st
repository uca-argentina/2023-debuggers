"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIngSoft2Model,
	#superclass : #PackageManifest,
	#category : #'IngSoft2-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestIngSoft2Model class >> ruleGuardingClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GalaxyCircuitGame #updateLap #false)) #'2023-06-01T23:53:28.295-03:00') #(#(#RGMethodDefinition #(#GalaxyCircuitGame #updateLapTo: #false)) #'2023-06-02T00:20:26.096-03:00') )
]

{ #category : #'code-critics' }
ManifestIngSoft2Model class >> ruleReGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GalaxyCircuitGame #updateLap #false)) #'2023-06-01T23:53:25.129-03:00') #(#(#RGMethodDefinition #(#GalaxyCircuitGame #updateLapTo: #false)) #'2023-06-02T00:20:28.413-03:00') )
]
