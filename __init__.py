import hy
from trytond.pool import Pool
from . import hello


def register():
    Pool.register(
        hello.Hello,
        module='hello_company_prefix', type_='model')
