

(define (cont-frac n d k)  
    (define (cont-frac-iter n d cur i)      
      (if (= i k)
        (/ cur (d i))
        (/ cur (+ (d i) (cont-frac-iter n d cur (+ i 1))))
      )
    )
    (cont-frac-iter n d (n 1) 1)
)
(cont-frac (lambda(j) 1.0) (lambda(j) 1.0) 100)

