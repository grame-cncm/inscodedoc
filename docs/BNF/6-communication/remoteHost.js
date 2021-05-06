ComplexDiagram(
	OneOrMore (Sequence (Choice (0, Sequence (Comment ('1'), 'http://'), Sequence (Comment ('2'), 'https://'), Sequence (Comment ('3'), 'ws://')), NonTerminal('hostname'), ':', NonTerminal('portnum')))
).addTo()

