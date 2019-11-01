(define (is-smaller-than a b c) 
  (if (and (< a b) (< a c)) true false))

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (largest-two-sum-of-squares a b c) 
  (cond ((is-smaller-than a b c) (sum-of-squares b c))
        ((is-smaller-than b a c) (sum-of-squares a c))
        ((is-smaller-than c a b) (sum-of-squares a b))
  ))

(largest-two-sum-of-squares 1 3 3)