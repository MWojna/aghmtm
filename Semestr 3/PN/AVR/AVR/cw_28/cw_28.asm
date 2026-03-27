Main: ldi R18, $1E
      OUT DDRB, R18
      OUT PORTB, R18
      ldi R18, 0
      OUT PORTB, R18
      rcall Main