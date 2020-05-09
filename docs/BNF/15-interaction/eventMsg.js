ComplexDiagram(
	Sequence ('event', Choice (0, Sequence (Comment ('1'), Sequence (Choice (0, NonTerminal('mouseEvent'), NonTerminal('touchEvent')), NonTerminal('float32'), NonTerminal('float32'))), Sequence (Comment ('2'), NonTerminal('userEvent'), Optional  ( OneOrMore (NonTerminal('var')))), Sequence (Comment ('3'), NonTerminal('eventName'))))
).addTo()

