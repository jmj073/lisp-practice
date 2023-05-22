(let f ((a (read)) (b (read)))
    (if (not (eof-object? a))
        (begin
            (print (+ a b))
            (f (read) (read)))))