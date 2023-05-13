(let* ((yin  ((lambda (k) (display #\@) k) (call/cc (lambda (k) k))))   
        (yang ((lambda (k) (display #\*) k) (call/cc (lambda (k) k)))))  
    (yin yang))