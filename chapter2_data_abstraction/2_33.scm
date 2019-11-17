(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op
		      initial
		      (cdr sequence)))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append '(1 2 3) '(4 5 6))

(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) '() seq))

(map (lambda (x) (* x x)) '(1 2 3))


(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(length '(1 2 3))
