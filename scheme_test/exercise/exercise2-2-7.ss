(car '((a b) (c d)))
(car (car '((a b) (c d))))
(cdr (car '((a b) (c d))))
(car (cdr (car '((a b) (c d)))))
(cdr (cdr (car '((a b) (c d)))))
(cdr '((a b) (c d)))
(car (cdr '((a b) (c d))))
(car (car (cdr '((a b) (c d)))))
(cdr (car (cdr '((a b) (c d)))))
(car (cdr (car (cdr '((a b) (c d))))))
(cdr (cdr (car (cdr '((a b) (c d))))))
(cdr (cdr '((a b) (c d))))

(let ((x 1)) (let ((x (+ x 3)) (y x)) (/ x y)))
(let ((x 1)) (let ((y x) (x (+ x 3))) (/ x y)))