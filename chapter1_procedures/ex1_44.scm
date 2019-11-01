(define (compose f g)
 (lambda (x) (f (g x)))
)

(define (inc i) (+ i 1))

(define dx 0.00001)

(define (repeated f n) 
  (define (repeated-iter fn n i)
    (if (= i n)
      fn
      (repeated-iter (compose f fn) n (inc i))
    )
  )
  (repeated-iter f n 1)
)

(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)) ))  
)

(define (n-fold-smoothed f n)
  ((repeated smooth f) 5) 
)

((repeated square 2) 5)