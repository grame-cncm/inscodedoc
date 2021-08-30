ComplexDiagram(
	Sequence (Choice (0, 'connect', 'disconnect'), OneOrMore (Choice (0, Sequence (Comment ('1'), NonTerminal('destination')), Sequence (Comment ('2'), NonTerminal('int32'), ':', NonTerminal('destination'), ':', NonTerminal('int32')))))
).addTo()

