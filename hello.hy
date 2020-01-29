(import [trytond.pool [PoolMeta Pool]])
(import [trytond.model [fields ModelSQL]])
(import [trytond.modules.company.model [CompanyMultiValueMixin CompanyValueMixin]])

(defclass Hello [:metaclass PoolMeta CompanyMultiValueMixin]
  "Hello World with prefix from company"
  [--name-- "hello"
   hello-company (.One2Many fields "hello.company" "hello" "HelloCompanies")
   co-prefix (.MultiValue fields (.Char fields "Company Prefix"))]

  (with-decorator classmethod
    (defn multivalue_model [cls field]
      (setv pool (Pool))
      (if (= field "co_prefix")
        (.get pool "hello.company")
        (.multivalue_model (super Hello cls) field))
      ))

  
  (defn get-greeting [self name]
    (setv su (super Hello self))
    (setv res (.get_greeting su name))
    (if self.co-prefix
      (+ self.co-prefix " " res)
      res)))

(defclass HelloCompany [ModelSQL CompanyValueMixin]
  "Hello Company"
  [--name-- "hello.company"
   hello (.Many2One fields
                    "hello"
                    "Hello"
                    :ondelete "CASCADE"
                    :select True)
   co-prefix (.Char fields "Company Prefix")])
