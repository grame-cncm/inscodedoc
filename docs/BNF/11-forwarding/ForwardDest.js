ComplexDiagram(
	OneOrMore (Sequence (Choice (0, Sequence (Comment ('1'), NonTerminal('hostname')), Sequence (Comment ('2'), 'osc://', NonTerminal('hostname')), Sequence (Comment ('3'), 'http://', NonTerminal('hostname')), Sequence (Comment ('4'), 'https://', NonTerminal('hostname')), Sequence (Comment ('5'), 'ws://', NonTerminal('hostname'))), Optional  ( Sequence (':', NonTerminal('portnum')))))
).addTo()

