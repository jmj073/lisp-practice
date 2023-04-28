(define tree-copy
    (lambda (t)
        (if (pair? t)
            (cons 
                (tree-copy (car t)) 
                (tree-copy (cdr t)))
            t)))

(display (tree-copy '(1 (3 . 5) 7 . 6)))