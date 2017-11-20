operations - page
get: anURL stopOn: aBlock
	"Navigate to the supplied URL, retrieve the DOM and answer the root node.
	Use the supplied block to determine if the content has been retrieved."

	| startTime now maxLoadSeconds loaded |

	startTime := DateAndTime now.
	maxLoadSeconds := 4 * 60.
	self pageLoadDelay: 1000.
	self
		enableDOM;
		enablePage;
		navigateTo: anURL;
		getDocument;
		getMissingChildren.

	loaded := aBlock value: self rootNode.
	now := DateAndTime now.
	[ loaded or: [ (now - startTime) > (Duration forSeconds: maxLoadSeconds) ] ] whileFalse: [ 
		self
			getDocument;
			getMissingChildren.
		loaded := aBlock value: self rootNode.
		now := DateAndTime now ].
	^self rootNode