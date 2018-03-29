$X = 2
$R = 1
$C = 3

$RICHARD = "RICHARD"
$GABRIEL = "GABRIEL"

def even_n_r()
  return $X < 7 && $R >= $X && ($R * $C) % $X == 0 && $X % 2 == 0 && $C >= $X / 2
end

def even_n_c()
  return $X < 7 && $C >= $X && ($R * $C) % $X == 0 && $X % 2 == 0 && $R >= $X / 2
end

def odd_n_r()
  return $X < 7 && $R >= $X && ($R * $C) % $X == 0 && $X % 2 != 0 && $C >= ($X / 2) + 1
end

def odd_n_c()
  return $X < 7 && $C >= $X && ($R * $C) % $X == 0 && $X % 2 != 0 && $R >= ($X / 2) + 1
end

def predict_who_wins()
  if even_n_r()
    print "#{$GABRIEL}\n"
    return
  end

  if even_n_c()
    print "#{$GABRIEL}\n"
    return
  end

  if odd_n_r()
    print "#{$GABRIEL}\n"
    return
  end

  if odd_n_c()
    print "#{$GABRIEL}\n"
    return
  end

  print "#{$RICHARD}\n"
  return
end

predict_who_wins()
