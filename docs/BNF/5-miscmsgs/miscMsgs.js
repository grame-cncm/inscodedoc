ComplexDiagram(
	Choice (0, Sequence ("eval", NonTerminal('msgsList')), Sequence ("watch", Optional  ( Sequence (NonTerminal('what'), Optional  ( NonTerminal('msgsList'))))), "push", "pop", Sequence ("map", Optional  ( NonTerminal('mapName')), Choice (0, NonTerminal('relation'), NonTerminal('del'))))
).addTo()

