ComplexDiagram(
	Sequence ('set', Choice (0, Sequence ('gmn', NonTerminal('gmnString')), Sequence ('gmnf', NonTerminal('gmnFilePath')), Sequence ('gmnstream', NonTerminal('gmnStream')), Sequence ('musicxml', NonTerminal('xmlString')), Sequence ('musicxmlf', NonTerminal('xmlFilePath')), Sequence ('gmn', 'expr', NonTerminal('scoreExpression'))))
).addTo()

