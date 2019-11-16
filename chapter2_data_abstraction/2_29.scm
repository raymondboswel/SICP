(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (is-weighted? branch)
  (not (pair? (car (cdr branch)))))

(define x (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? (car tree)))
	 (cons (car tree) (fringe (cdr tree))))
        (else (append (fringe (car tree))
		    (fringe (cdr tree))))))

(define (total-weight mobile)
  (define (sum lst)
    (if (null? (cdr lst))
	(car lst)
	(+ (car lst) (sum (cdr lst)))))
  (let ((weights (fringe mobile)))
    (sum weights)))

(define (is-balanced? mobile)
  (= (total-weight (left-branch mobile)) (total-weight (right-branch mobile))))
    
