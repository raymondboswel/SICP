((define (reverse lst)
  (if (null? (cdr lst))
      (car lst)
      (cons (reverse (cdr lst)) (car lst)))))
      
(reverse (list 1 4 9 16 25))
