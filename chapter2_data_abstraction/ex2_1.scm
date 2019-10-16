(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x) 
  (newline) 
  (display (numer x)) 
  (display "/" )
  (display(denom x)))

(define (make-rat n d)
  (let ((g (gcd n d)) (sign (/ (* n d) (abs (* n d)))))     
    (cons(/ (* (abs n) sign) g) (/ (abs d) g))))

(print-rat (make-rat -2 -4))