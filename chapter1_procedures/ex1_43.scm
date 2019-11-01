(define (compose f g)
 (lambda (x) (f (g x)))
)

(define (inc i) (+ i 1))

(define (repeated f n) 
  (define (repeated-iter fn n i)
    (if (= i n)
      fn
      (repeated-iter (compose f fn) n (inc i))
    )
  )
  (repeated-iter f n 1)
)

((repeated square 2) 5)