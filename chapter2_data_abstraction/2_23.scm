
(define (for-each items proc)
  (cond ((null? (cdr items))
	 (proc (car items))
	 #t)
	(else
	 (proc (car items))
	 (for-each (cdr items) proc))))

(for-each (list 1 2 3) (lambda (x) (display x) (display "\n")))      
