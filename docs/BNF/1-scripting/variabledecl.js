ComplexDiagram(
	Sequence ('ident', '=', Choice (0, OneOrMore (Choice (0, NonTerminal('param'), NonTerminal('variable'))), Sequence ('(', OneOrMore (NonTerminal('message'), ','), ')')), ';')
).addTo()

