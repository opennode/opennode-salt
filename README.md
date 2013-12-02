opennode-salt
=============

Saltstack magic for OpenNode artifacts

OMS installation
----------------

Prepare managed node:

	[remote]# yum install salt-minion
	[remote]# mkdir /srv/salt

Upload configuration:

	[local]~ scp -r oms <REMOTE_IP>:/srv/salt/

Run Salt. First step sets up build environment and builds OMS. Second step sets up environment where OMS can be run, and starts the service (requires built OMS to be there already):

	[remote]# salt-call --local state.sls oms.buildenv
	[remote]# salt-call --local state.sls oms.env

All done.
