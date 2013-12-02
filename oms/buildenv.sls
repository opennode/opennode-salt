# -*- coding: utf-8; indent-tabs-mode: nil; tab-width: 2; -*-

os_packages:
  pkg.installed:
  - pkgs:
    - gcc
    - git
    - mariadb-devel # oms.knot
    - openssl-devel
    - python-pip
    - python-virtualenv
    - salt-master

/opt/oms:
  virtualenv.managed:
  - system_site_packages: True

# TODO: Find a way to use pre-built eggs
pip_packages:
  pip.installed:
  - bin_env: /opt/oms
  - editable:
    - git+https://github.com/opennode/opennode-management#egg=opennode.oms.core
    - git+https://github.com/opennode/opennode-knot#egg=opennode.oms.knot
