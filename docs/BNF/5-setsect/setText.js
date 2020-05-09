ComplexDiagram(
	Sequence ('set', Choice (0, Sequence ('txt', Choice (0, NonTerminal('string'), NonTerminal('txtStream'))), Sequence ('txtf', NonTerminal('textFilePath')), Sequence ('html', NonTerminal('string')), Sequence ('htmlf', NonTerminal('htmlFilePath'))))
).addTo()

