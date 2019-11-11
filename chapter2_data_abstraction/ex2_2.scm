(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x) 
  (newline) 
  (display (numer x)) 
  (display "/" )
  (display(denom x)))

(define (make-rat n d)
  (let ((g (gcd n d)) (sign (/ (* n d) (abs (* n d)))))     
    (cons (/ (* (abs n) sign) g) (/ (abs d) g))))


(define (make-point x y)
  (cons x y)
)

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p) 
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s)
  (car s)
)

(define (end-segment s)
  (cdr s)
)

(define (midpoint segment)
  (let ((start (start-segment segment))
        (end (end-segment segment))
        )
    (x-avg (/ (+ (x-point start) (x-point end)) 2))
    (y-avg (/ (+ (y-point start) (y-point end)) 2))
    (make-point x-avg y-avg)
  )
)

(print-point (midpoint (make-segment (make-point 1 1) (make-point 2 2))))