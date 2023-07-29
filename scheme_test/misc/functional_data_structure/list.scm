(load "pair.scm")

(define null '())

(define Cons Pair)

(define get-head get-left)
(define get-tail get-right)

(define (myfor-each f ls)
  (if (not (null? ls))
    (ls (lambda (head tail)
          (f head)
          (myfor-each f tail)))))

(define (myfold-left f init ls)
  (if (null? ls)
    init
    (ls (lambda (head tail) (myfold-left f (f init head) tail)))))

(define (myfold-right f init ls)
  (if (null? ls)
    init
    (ls (lambda (head tail) (f head (myfold-right f init tail))))))

(define (get idx ls)
  (if (< idx 0) (error "out of bound"))
  (let get ((idx idx) (ls ls))
    (if (null? ls) (error "out of bound"))
    (ls (lambda (head tail)
          (if (zero? idx)
            head
            (get (- idx 1) tail))))))

(define (set-ls! value idx ls)
  (if (< idx 0) (error "out of bound"))
  (let set ((idx idx) (ls ls))
    (if (null? ls) (error "out of bound"))
    (ls (lambda (head tail)
          (if (zero? idx)
            (Cons value tail)
            (Cons head (set (- idx 1) tail)))))))

(define (myappend value ls)
  (myfold-right Cons (Cons value null) ls))

(define prepend Cons)

(define (myreverse ls)
  (myfold-left (lambda (a b) (Cons b a)) null ls))

(define (print-ls ls)
  (myfor-each
    (lambda (x)
        (display x)
        (display #\space))
    ls)
  (newline))

(define ls (Cons 1 (Cons 2 (Cons 3 null))))


(print "first element: " (get 0 ls))
(print "third element: " (get 2 ls))

(display "append 4: ")
(print-ls (myappend 4 ls))
(display "prepend 4: ")
(print-ls (prepend 4 ls))
(display "reverse 4: ")
(print-ls (myreverse ls))
(display "set ls[1] to 4: ")
(print-ls (set-ls! 4 1 ls))


(load "pipe.scm")

(define f (pipe
            (bind myappend 4)
            (bind myappend 4)
            (bind set-ls! 99 3)))

(display "pipe: ")
(print-ls (f ls))










