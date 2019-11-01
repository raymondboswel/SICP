(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a result)
    (begin
      (if (> a b )     
        result
        (if (predicate a)
          (iter (next a) (combiner (term a) result))
          (iter (next a) result))))
    )
  (iter a null-value))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
     (define (try-it a)
       (= (expmod a n n) a))
     (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(filtered-accumulate + 0 identity 0 inc 4 even?)

(define (sum-of-primes a b)
  (filtered-accumulate + 0 square a inc b (lambda (x) (fast-prime? x 100)))
)

(define (product-of-rel-primes a b)  
  (filtered-accumulate * 1 identity a inc b (lambda (i) (= (gcd i b) 1)))
)

(product-of-rel-primes 1 5)
