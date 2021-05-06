ComplexDiagram(
	Sequence (NonTerminal('OSCAddress'), 'alias', Choice (0, Sequence (Comment ('1'), NonTerminal('OSCAlias'), Optional (OneOrMore (Sequence (NonTerminal('message'), Optional ('[n,m]') ))) ), Comment ('2')))
).addTo()

