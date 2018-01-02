(import [trytond.pool [PoolMeta]])
(import [trytond.model [fields]])
(def --all-- ["Hello"])

(defclass Hello []
  "Hello World with prefix from company"
  [--name-- "hello"
   --metaclass-- PoolMeta
   co-prefix (.Property fields  (.Char fields "Company Prefix"))]

  (defn get-greeting [self name]
    (setv su (super Hello self))
    (setv res (.get_greeting su name))
    (if self.co-prefix
      (+ self.co-prefix " " res)
      res)))
