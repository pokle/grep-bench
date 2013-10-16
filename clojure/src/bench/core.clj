;
; This manages 4mb/sec 100%cpu on my SSD Mac Mini :-(
;
; Examples: 
;
;   lein run -m bench.core/-main root /etc/passwd
;   lein run root /etc/passwd
;

(ns bench.core)
(use 'clojure.java.io)

(defn -main [term file]
  (with-open [rdr (reader file)]
    (doseq [line (line-seq rdr)]
      (if (. line contains term) (println line))
    )))

