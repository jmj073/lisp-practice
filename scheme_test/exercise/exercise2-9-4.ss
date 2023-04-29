(define make-stack
    (lambda ()

        (define next-len
            (lambda (vec)
                (let ((len (vector-length vec)))
                    (if (zero? len) 4 (* len 2)))))

        (define cpy-stack
            (lambda (dst src)
                (define cpy
                    (lambda (d s)
                        (if (not (zero? s))
                            (let ((d (- d 1)) (s (- s 1)))
                                (vector-set! dst d
                                    (vector-ref src s))
                                (cpy d s)))))
                (cpy (vector-length dst) (vector-length src))))

        (let ((vec (vector)) (top 0))
            (lambda (msg . x)
                (case msg
                    ((push!)
                        (if (zero? top)
                            (let (
                                    (vec2 (make-vector (next-len vec)))
                                    (sz (- (vector-length vec) top)))
                                (cpy-stack vec2 vec)
                                (set! vec vec2)
                                (set! top (- (vector-length vec) sz))))
                        (set! top (- top 1))
                        (vector-set! vec top (car x)))
                    ((pop!)
                        (if (= (vector-length vec) top)
                            'empty
                            (set! top (+ top 1))))
                    ((empty? mt?)
                        (= (vector-length vec) top))
                    ((top)
                        (vector-ref vec top))
                    ((ref)
                        (vector-ref vec (+ (car x) top)))
                    ((set!)
                        (vector-set! vec (+ (car x) top) (cadr x)))
                    ((get-top)
                        top)
                    ((get-vec)
                        vec)
                    (else 'undefined))))))