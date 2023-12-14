preferences
mailhost
  ^ self preferenceAt: #'mailhost' ifAbsent: [ 'localhost' ]