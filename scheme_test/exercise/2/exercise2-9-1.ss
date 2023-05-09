(define make-counter
    (lambda (init inc)
        (let ((nxt init))
            (lambda ()
                (let ((cur nxt))
                    (set! nxt (+ nxt inc))
                    cur)))))