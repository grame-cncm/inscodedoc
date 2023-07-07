ComplexDiagram(
	Choice (0, 'quit', Sequence ('scenes', OneOrMore (NonTerminal('string'))), Sequence ('rootPath', NonTerminal('path')), Sequence ('preprocess', NonTerminal('file')), Sequence ('mouse', Choice (0, 'show', 'hide')), Sequence ('defaultShow', NonTerminal('int32')), Sequence ('load', NonTerminal('filePath')), Sequence ('read', NonTerminal('buffer')), Sequence ('require', NonTerminal('float'), NonTerminal('oscMsg')), Sequence ('compatibility', NonTerminal('float')), Sequence ('errorAddress', NonTerminal('string')), Sequence ('time', NonTerminal('int32')), Sequence ('ticks', NonTerminal('int32')), Sequence ('rate', NonTerminal('int32')), 'hello', NonTerminal('forwardingMsg'))
).addTo()

