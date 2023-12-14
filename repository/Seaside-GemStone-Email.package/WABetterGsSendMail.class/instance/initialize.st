initialize-release
initialize
  super initialize	"NEVER runs! Since GsSocket redefines >>new and only does basicNew. Strange!"	"  self mailhostName: self class mailhost.
  self from: self class mailfrom"