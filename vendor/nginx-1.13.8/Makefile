
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/tmp/local/sbin/groonga-httpd -t

	kill -USR2 `cat /tmp/local/var/run/groonga/groonga-httpd.pid`
	sleep 1
	test -f /tmp/local/var/run/groonga/groonga-httpd.pid.oldbin

	kill -QUIT `cat /tmp/local/var/run/groonga/groonga-httpd.pid.oldbin`
