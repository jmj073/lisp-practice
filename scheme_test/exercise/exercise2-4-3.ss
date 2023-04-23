; a===================================
(let ((x 'a) (y 'b))
    (list 
        (let ((x 'c)) (cons x y))
        (let ((y 'd)) (cons x y))
    )
)

(let ((x 'a) (y 'b))
    (list 
        (let ((nx 'c)) (cons nx y))
        (let ((ny 'd)) (cons x ny))
    )
)

; b===================================
(let ((x '((a b) c)))
    (cons 
        (let ((x (cdr x))) 
            (car x)
        )
        (let ((x (car x)))
            (cons 
                (let ((x (cdr x)))
                    (car x)
                )
                (cons 
                    (let ((x (car x)))
                        x
                    )
                    (cdr x)
                )
            )
        )
    )
)

(let ((x0 '((a b) c))); x0 <- ((a b) c)
    (cons 
        (let ((x1 (cdr x0))); x1 <- (c)
            (car x1); <- c
        ); <- c
        (let ((x2 (car x0))); x2 <- (a b)
            (cons
                (let ((x3 (cdr x2))); x3 <- (b)
                    (car x3); <- b
                ); <- b
                (cons 
                    (let ((x4 (car x2))); x4 <- a
                        x4; <- a
                    )
                    (cdr x2); <- (b)
                ); <- (a b)
            ); <- (b a b)
        ); <- (b a b)
    ); <- (c b a b)
); <- (c b a b)