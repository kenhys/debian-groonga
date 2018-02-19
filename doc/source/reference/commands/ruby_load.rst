.. -*- rst -*-

.. highlightlang:: none

.. groonga-command
.. database: commands_ruby_load

``ruby_load``
=============

Summary
-------

``ruby_load`` command loads specified Ruby script.

Syntax
------

This command takes only one required parameter::

  ruby_load path

Usage
-----

You can load any script file which mruby supports by calling ``ruby_load``.

Here is an example that just load ``expression.rb`` as Ruby script.

.. groonga-command
.. include:: ../../example/reference/commands/ruby_load/load.log
.. plugin_register ruby/load
.. ruby_load "expression.rb"

Register ``ruby/load`` plugin to use ``ruby_load`` command in advance.

Note that ``ruby_load`` is implemented as an experimental plugin,
and the specification may be changed in the future.

Parameters
----------

This section describes all parameters.

``path``
""""""""

Specifies the Ruby script path which you want to load.

Return value
------------

``ruby_load`` returns the loaded result with metadata such as
exception information (Including metadata isn't implemented yet)::

  [HEADER, {"value": LOADED_VALUE}]

``HEADER``

  See :doc:`/reference/command/output_format` about ``HEADER``.

``LOADED_VALUE``

  ``LOADED_VALUE`` is the loaded value of ruby script.

  ``ruby_load`` just return ``null`` as ``LOADED_VALUE`` for now, it will be supported in the future.

See also
--------

:doc:`/reference/commands/ruby_eval`
