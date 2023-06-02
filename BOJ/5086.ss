(do ((a (read) (read)) (b (read) (read)))
    ((zero? a))
    (display
        (if (zero? (modulo b a))
            "factor"
            (if (zero? (modulo a b))
                "multiple"
                "neither")))
    (newline))