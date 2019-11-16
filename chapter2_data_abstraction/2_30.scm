
(define (square-tree tree)
  (map (lambda (x)
	 (if (pair? x)
	     (square-tree x)
	     (* x x)))
       tree))

(square-tree (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
