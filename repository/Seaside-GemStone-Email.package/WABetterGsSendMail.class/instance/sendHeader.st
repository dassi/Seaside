private
sendHeader
  | stream |
  stream := WriteStream on: String new.
  stream nextPutAll: 'From: '.
  fromName
    ifNil: [ stream nextPutAll: self from ]
    ifNotNil: [ 
      stream
        nextPutAll: fromName;
        nextPutAll: '<';
        nextPutAll: self from;
        nextPutAll: '>' ].
  stream
    nextPutAll: self crlfString;
    nextPutAll: 'To: ';
    nextPutAll: self to;
    nextPutAll: self crlfString.
  stream
    nextPutAll: 'Cc: ';
    nextPutAll: self cc;
    nextPutAll: self crlfString.
  self headers
    keysAndValuesDo: [ :key :value | 
      stream
        nextPutAll: key asString;
        nextPut: $:;
        nextPut: Character space;
        nextPutAll: value asString;
        nextPutAll: self crlfString ].
  stream
    nextPutAll: 'Subject: ';
    nextPutAll: self subject;
    nextPutAll: self crlfString.
  stream nextPutAll: self crlfString.
  ^ self sendCrlfString: stream contents