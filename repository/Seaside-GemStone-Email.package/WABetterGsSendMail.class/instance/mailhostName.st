Accessing
mailhostName
  ^ mailhostName ~~ nil
    ifTrue: [ mailhostName ]
    ifFalse: [ self class mailhost ]