accessing
baseURL
	"For a description of node attributes, please see https://chromedevtools.github.io/devtools-protocol/1-2/DOM/"

	^dictionary at: 'baseURL' ifAbsent: [nil]