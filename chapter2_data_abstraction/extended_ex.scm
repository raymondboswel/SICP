(define (make-interval lower upper)
  (cons lower upper)
)

(define (lower-bound interval)
  (car interval)
)

(define (upper-bound interval)
  (cdr interval)
)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (spans-zero interval)
  (and (<= (lower-bound interval) 0) 
     (>= (upper-bound interval) 0))
      
)

(define (div-interval x y)
  (if (spans-zero y)
  (error "divisor interval spans zero, and therefore not defined across entire interval")
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) 
                    (upper-bound y))
                 (- (upper-bound x) 
                    (lower-bound y))))

(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

(add-interval (make-interval 0.9 1.1) (make-interval 0.9 1.1))

(mul-interval (make-interval 0.9 1.1) (make-interval 0.9 1.1))

(div-interval (make-interval 0.9 1.1) (make-interval 0.9 1.1))

(sub-interval (make-interval 0.9 1.1) (make-interval 0.9 1.1))

(width (make-interval 0.9 1.1))

(width(sub-interval (make-interval 0.5 1.1) (make-interval 0.9 1.1)))

(width(add-interval (make-interval 0.5 1.1) (make-interval 0.9 1.1)))

(width(div-interval (make-interval -0.1 0.1) (make-interval -1 1.1)))

