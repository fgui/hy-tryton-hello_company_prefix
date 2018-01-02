# Hello Company Property

*Only for tryton < 4.4*

Learning how to use a Property to have a field in a Model which value is different for each company. The value of the current logged user's main company is used (displayes/recorded).

As far as I can tell Property is a Model/Table that can store any field which has a company relation with a rule on the company that selects only the rows which have the same company as the currently log user. See the hy-motto-company project to see a simple example of a Model where each "instance" is for and has a company.

*Property field* has been removed in tryton 4.4. There is new *MultiValue field* to implement similar functionality without using the Property model/table.