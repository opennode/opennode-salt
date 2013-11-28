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
    - vzctl-core

/etc/logrotate.d/omsd:
  file.managed:
  - source: salt://oms/etc/logrotate.d/omsd

/etc/opennode/logging.conf:
  file.managed:
  - source: salt://oms/etc/opennode/logging.conf

/etc/opennode/oms.conf:
  file.managed:
  - source: salt://oms/etc/opennode/oms.conf

/opt/oms/oms_passwd:
  file.managed:
  - source: salt://oms/oms_passwd

/usr/lib/systemd/system/oms.service:
  file.managed:
  - source: salt://oms/systemd/oms.service

/var/log/opennode:
  file.directory

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

oms:
  service:
  - enable: True
  - running
