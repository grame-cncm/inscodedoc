ComplexDiagram(
	Sequence ('ident', '=', Choice (0, OneOrMore (Choice (0, NonTerminal('param'), NonTerminal('variable'))), Sequence ('(', Sequence (OneOrMore (NonTerminal('message')), ','), ')')), ';')
).addTo()

