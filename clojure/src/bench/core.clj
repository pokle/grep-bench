;
; This manages 4mb/sec 100%cpu on my SSD Mac Mini :-(
;
; Example usage: lein run -m bench.core/grep root /etc/passwd
;

(ns bench.core)
(use 'clojure.java.io)

(defn -main [term file]
  (with-open [rdr (reader file)]
    (doseq [line (line-seq rdr)]
      (if (. line startsWith term) (println line))
    )))

