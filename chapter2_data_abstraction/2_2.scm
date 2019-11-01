
(define (make-point  x y)
  (cons x y)
)

(define (x-point p)
  (car p)
)

(define (y-point p)
  (cdr p)
)

(define (make-segment a b)
  (cons a b)
)

(define (start-segment a)
  (car a)
)

(define (end-segment a)
  (cdr a)
)

(define (avg a b)
  (/ (+ a b ) 2)
)

(define (midpoint-segment s)
  (make-point (avg (x-point (start-segment s) ) (x-point (end-segment s) ) ) 
              (avg (y-point (start-segment s) ) (y-point (end-segment s) ) ) )
)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 1 1) (make-point 2 2))) )