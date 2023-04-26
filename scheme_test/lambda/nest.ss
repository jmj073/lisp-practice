(let (
        (f ((lambda (a) (lambda (b) (+ a b))) 3))
    )
    (f 5)
)

(let ((x 'a))
    (let ((f (lambda (y) (list x y))))
        (f 'b)
    )
)

(let (
        (f 
            (let ((x 'sam))
                (lambda (y z) (list x y z))
            )
        )
    )
    (f 'i 'am)
); => (sam i am)

(let (
        (f 
            (let ((x 'sam))
                (lambda (y z) (list x y z))
            )
        )
    )
    (let ((x 'not-sam))
        (f 'i 'am)
    )
); => (sam i am)