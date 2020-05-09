ComplexDiagram(
	Choice (0, 'new', 'del', 'reset', 'foreground', Sequence ('rootPath', Optional (NonTerminal('path')) ), Sequence ('preprocess', NonTerminal('file')), Sequence ('load', NonTerminal('filePath')), Sequence ('fullscreen', NonTerminal('int32')), Sequence ('frameless', NonTerminal('int32')), Sequence ('absolutexy', NonTerminal('int32')), Sequence ('windowOpacity', NonTerminal('int32')), NonTerminal('commonMsg'), NonTerminal('forwardingMsg'))
).addTo()

