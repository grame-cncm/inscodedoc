ComplexDiagram(
	Choice (0, OneOrMore (Sequence (Comment ('1'), NonTerminal('float2DSegment'), NonTerminal('timeSegment'))), OneOrMore (Sequence (Comment ('2'), NonTerminal('int2DSegment'), NonTerminal('timeSegment'))), OneOrMore (Sequence (Comment ('3'), NonTerminal('int1DSegment'), NonTerminal('timeSegment'))))
).addTo()

