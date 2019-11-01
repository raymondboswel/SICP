(define (cons a b)
  (* (expt 2 a) (expt 3 b))
)


(define (factor-out-x n x) 
  (if (> (modulo n x) 0)
    n
    (factor-out-x (/ n x) x))
)

(define (get-exponent n base)
 (/ (log n) (log base))
)

(define (car p)
  (get-exponent (factor-out-x p 3) 2)
)

(define (cdr p)
  (get-exponent (factor-out-x p 2) 3)
)
