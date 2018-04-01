;Rabia Çakas 141044042 PROJE 1;
(use 'clojure.java.io)

(with-open [rdr (reader "CoffeeSample.coffee")]
  (doseq [line (line-seq rdr)]

  	(def size(count line))
  	(loop [x 0]
      (when (< x size)
         (if (or (= (get line x) \+) (= (get line x) \-)  (= (get line x) \*) (= (get line x) \/) (= (get line x) \( )
	    	(= (get line x) \) ) (= (get line x) \,))
	    	(println "Operator: " (get line x)))

         (if (or (= (get line x) \0) (= (get line x) \1)  (= (get line x) \2) (= (get line x) \3) (= (get line x) \4)
	    	(= (get line x) \5 ) (= (get line x) \6) (= (get line x) \7) (= (get line x) \8) (= (get line x) \9))
	    	(println "IntegerValue: " (get line x)))

         (if (if (= (get line x) \o) (= (get line (+ x 1)) \r)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))))

         (if (if (= (get line x) \i) (= (get line (+ x 1)) \f)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))))

         (if (if (= (get line x) \a) (= (get line (+ x 1)) \n) (= (get line (+ x 2)) \d)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2))))

         (if (if (= (get line x) \f) (= (get line (+ x 1)) \o) (= (get line (+ x 2)) \r)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2))))

         (if (if (= (get line x) \s) (= (get line (+ x 1)) \e) (= (get line (+ x 2)) \t)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2))))

         (if (if (= (get line x) \n) (= (get line (+ x 1)) \o) (= (get line (+ x 2)) \t)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2))))

         (if (if (= (get line x) \e) (= (get line (+ x 1)) \q) (= (get line (+ x 2)) \u))
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2)) "a l"))

         (if (if (= (get line x) \f) (= (get line (+ x 1)) \a) (= (get line (+ x 2)) \l)) 
	    	(println "BinaryValue: " (get line x)(get line (+ x 1))(get line (+ x 2)) "s e"))

         (if (if (= (get line x) \t) (= (get line (+ x 1)) \r) (= (get line (+ x 2)) \u)) 
	    	(println "BinaryValue: " (get line x)(get line (+ x 1))(get line (+ x 2)) " e"))

         (if (if (= (get line x) \a) (= (get line (+ x 1)) \p) (= (get line (+ x 2)) \p)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2)) " e n d"))

         (if (if (= (get line x) \c) (= (get line (+ x 1)) \o) (= (get line (+ x 2)) \n)) 
	    	(println "Keyword: " (get line x)(get line (+ x 1))(get line (+ x 2)) "c a t"))

         (recur (+ x 1))))
    

    )
)

(defn map_example [s]
  (reduce conj (map hash-map [:Operator :identifier :value] (.split s " "))))
