ComplexDiagram(
	Choice (0, Sequence ('show', NonTerminal('int32')), 'del', Sequence ('lock', NonTerminal('int32')), Sequence (Choice (0, 'export', 'exportAll'), Choice (0, OneOrMore (Sequence (Comment ('1'), NonTerminal('filePath'))), Comment ('2'))), Sequence ('save', Optional  ( OneOrMore ('message')), NonTerminal('filePath'), Optional  ( '+')), NonTerminal('PositionMsg'), NonTerminal('ColorMsg'), NonTerminal('TimeMsg'), NonTerminal('WatchMsg'), NonTerminal('EventMsg'))
).addTo()

