;
; This manager 4mb/sec 100%cpu on my SSD Mac Mini :-(
;
;
(ns ldiftools.core)
(use 'clojure.java.io)

(defn grep [file]
  (with-open [rdr (reader file)]
    (doseq [line (line-seq rdr)]
      (if (. line startsWith "cn: ") (println line))
    )))

;(defn -main [& args] 
  (grep "/Users/tushar/Downloads/in/residential.ldif")
