(let ((x (call/cc (lambda (k) k))))  
    (x (lambda (ignore) "hi"))); => "hi"

(((call/cc (lambda (k) k)) (lambda (x) x)) "HEY!"); => "HEY!"