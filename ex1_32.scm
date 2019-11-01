(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b )
      result
      (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (identity x) x)
(define (square x) (* x x))


(define (inc x) (+ x 1))

(accumulate + 0 square 0 inc 3)