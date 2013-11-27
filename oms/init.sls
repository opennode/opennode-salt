# -*- coding: utf-8; indent-tabs-mode: nil; tab-width: 2; -*-
#
# Usage: salt-call --local state.sls oms

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

/etc/opennode/oms.conf:
  file.managed:
  - source: salt://oms/opennode/oms.conf

/usr/lib/systemd/system/oms.service:
  file.managed:
  - source: salt://oms/systemd/oms.service

/opt/oms:
  virtualenv.managed:
  - system_site_packages: True

/opt/oms/db:
  file.directory

# TODO: Find a way to use pre-built eggs
pip_packages:
  pip.installed:
  - bin_env: /opt/oms
  - editable:
    - git+https://github.com/opennode/opennode-management#egg=opennode.oms.core
    - git+https://github.com/opennode/opennode-knot#egg=opennode.oms.knot


