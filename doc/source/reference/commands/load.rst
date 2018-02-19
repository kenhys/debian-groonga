.. -*- rst -*-

.. highlightlang:: none

.. groonga-command
.. database: commands_load

``load``
========

Summary
-------


``load`` loads data as records in the current database and updates values of each columns.

Syntax
------
::

 load values table [columns [ifexists [input_type]]]

Parameters
----------

This section describes all parameters.

``values``

  Specifies values loaded to records.
  Values should satisfy ``input_type`` format.
  If you specify "json" as ``input_type``, you can choose a format from below:

  ``Format 1:``
    [[COLUMN_NAME1, COLUMN_NAME2,..], [VALUE1, VALUE2,..], [VALUE1, VALUE2,..],..]

  ``Format 2:``
    [{COLUMN_NAME1: VALUE1, COLUMN_NAME2: VALUE2}, {COLUMN_NAME1: VALUE1, COLUMN_NAME2: VALUE2},..]

  ``[COLUMN_NAME1, COLUMN_NAME2,..]`` format in ``Format 1`` is effective only when ``columns`` parameter isn't specified.

  When a target table contains primary key, you must specify ``_key`` column (pseudo column associated primary key) as the one of ``COLUMN_NAME``.

  If ``values`` isn't specified any values, they are read from the standard input until all opened parenthes match their closed ones.
  You don't have to enclose them with single-quotes or double-quotes, but if you specified values with ``values`` parameter, you should do.

  In following values, you also don't have to enclose any spaces (' ') with single-quotes or double-quotes.

``table``

  Specifies a table name you want to add records.

``columns``

  Specifies column names in added records with comma separations.

``ifexists``

  Specifies executed ``grn_expr`` string when the same primary key
  as added records already exists in your table.
  If ``ifexists`` specifies ``grn_expr`` string (default: true) and
  its value is true, values in other (all columns excluding ``_key``
  column) columns is updated.

``input_type``

  Specifies an input format for ``values``. It supports JSON only.

Usage
-----

Here is an example to add records to "Entry" table. ::

 load --table Entry --input_type json --values [{\"_key\":\"Groonga\",\"body\":\"It's very fast!!\"}]

 [1]

This example shows how to add values from standard input. ::

 load --table Entry --input_type json
 [
 {"_key": "Groonga", "body": "It's very fast!!"}
 ]

 [1]

Return value
------------

JSON format
^^^^^^^^^^^

 ``load`` returns the number of added records such as ::

   [NUMBER]

See also
--------

:doc:`/reference/grn_expr`
