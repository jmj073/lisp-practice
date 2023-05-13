(define empty? null?)
(define (void) #<void>)

(define thread-queue '()); 1

(define (enqueue thread)
  (set! thread-queue (append thread-queue (list thread))))

(define (dequeue)
  (let ((thread (car thread-queue)))
    (set! thread-queue (cdr thread-queue))
    thread))

(define halt #f); 2

(define (cc); 3
  (call/cc (lambda (k) k)))

(define (spawn thunk); 4
  (let ((k (cc)))
    (if (procedure? k); 'resume이 아니면?
      (enqueue k)
      (begin
        (thunk)
        (quit)))))

(define (yield); 5
  (let ((k (cc)))
    (if (and (procedure? k) (not (empty? thread-queue)))
      (let ((next-thread (dequeue)))
        (enqueue k)
        (next-thread 'resume))
      (void))))

(define (quit); 6
  (if (empty? thread-queue)
    (halt)
    (let ((next-thread (dequeue)))
      (next-thread 'resume))))

(define (start-threads); 7
  (let ((k (cc)))
    (if k; halt로 인한 것인지에 대한 여부
      (begin
        (set! halt (lambda () (k #f)))
        (if (not (empty? thread-queue))
            (let ((next-thread (dequeue)))
              (next-thread 'resume)))))))


;; 제어를 서로 주거니 받거니 하면서 협력하는 스레드 예제
(newline)

(define counter 10)

(define (print-helper name counter)
  (display "in thread ")
  (display name)
  (display "; counter = ")
  (display counter)
  (newline))

(define (make-thread-thunk name)
  (lambda ()
    (let loop ()
      (if (< counter 0)
          (quit)
          (begin
            ; (printf "in thread ~a; counter = ~a\n" name counter)
            (print-helper name counter)
            (set! counter (- counter 1))
            (yield)
            (loop))))))

(spawn (make-thread-thunk 'a)); 9 
(spawn (make-thread-thunk 'b)); 10
(spawn (make-thread-thunk 'c)); 11
(start-threads); 12