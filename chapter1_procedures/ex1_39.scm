

(define (cont-frac n d k)  
    (define (cont-frac-iter n d cur i)      
      (if (= i k)
        (/ cur (d i))
        (/ cur (- (d i) (cont-frac-iter n d cur (+ i 1))))
      )
    )
    (cont-frac-iter n d (n 1) 1)
)

(define (n x i)
  (if (= i 1)
    x
    (* x x)    
  )
)

(define (d n) 
  (- (* n 2) 1)
)


(define (tan-cf x k) 
 (cont-frac (lambda(j) (n x j)) d k) 
)

(tan-cf 1 10)
