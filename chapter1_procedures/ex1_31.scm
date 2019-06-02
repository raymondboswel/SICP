(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b) )
  )
)

(define (inc n) (+ n 1))


(define (pi-over-4-term n)
  (let ((num (if (odd? n)
                (+ n 1)
                (+ n 2)))
        (denom (if (odd? n)
                  (+ n 2)
                  (+ n 1)
        )))
       (/ num denom)
  )
)

(product pi-over-4-term 1 inc 200)