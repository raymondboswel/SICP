(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map (cdr items)))))
