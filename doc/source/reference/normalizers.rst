.. -*- rst -*-

.. highlightlang:: none

.. groonga-command
.. database: normalisers

Normalizers
===========

Summary
-------

Groonga has normalizer module that normalizes text. It is used when
tokenizing text and storing table key. For example, ``A`` and ``a``
are processed as the same character after normalization.

Normalizer module can be added as a plugin. You can customize text
normalization by registering your normalizer plugins to Groonga.

A normalizer module is attached to a table. A table can have zero or
one normalizer module. You can attach a normalizer module to a table
by :ref:`table-create-normalizer` option in
:doc:`/reference/commands/table_create`.

Here is an example ``table_create`` that uses ``NormalizerAuto``
normalizer module:

.. groonga-command
.. include:: ../example/reference/normalizers/example-table-create.log
.. table_create Dictionary TABLE_HASH_KEY ShortText --normalizer NormalizerAuto

.. note::

   Groonga 2.0.9 or earlier doesn't have ``--normalizer`` option in
   ``table_create``. ``KEY_NORMALIZE`` flag was used instead.

   You can open an old database by Groonga 2.1.0 or later. An old
   database means that the database is created by Groonga 2.0.9 or
   earlier. But you cannot open the opened old database by Groonga
   2.0.9 or earlier. Once you open the old database by Groonga 2.1.0
   or later, ``KEY_NORMALIZE`` flag information in the old database is
   converted to normalizer information. So Groonga 2.0.9 or earlier
   cannot find ``KEY_NORMALIZE`` flag information in the opened old
   database.

Keys of a table that has a normalizer module are normalized:

.. groonga-command
.. include:: ../example/reference/normalizers/example-load.log
.. load --table Dictionary
.. [
.. {"_key": "Apple"},
.. {"_key": "black"},
.. {"_key": "COLOR"}
.. ]
.. select Dictionary

``NormalizerAuto`` normalizer normalizes a text as a downcased text.
For example, ``"Apple"`` is normalized to ``"apple"``, ``"black"`` is
normalized to ``"black"`` and ``"COLOR"`` is normalized to
``"color"``.

If a table is a lexicon for fulltext search, tokenized tokens are
normalized. Because tokens are stored as table keys. Table keys are
normalized as described above.

Built-in normalizers
--------------------

Here is a list of built-in normalizers:

  * ``NormalizerAuto``
  * ``NormalizerNFKC51``

.. _normalizer-auto:

``NormalizerAuto``
^^^^^^^^^^^^^^^^^^

Normally you should use ``NormalizerAuto``
normalizer. ``NormalizerAuto`` was the normalizer for Groonga 2.0.9 or
earlier. ``KEY_NORMALIZE`` flag in ``table_create`` on Groonga 2.0.9
or earlier equals to ``--normalizer NormalizerAuto`` option in
``table_create`` on Groonga 2.1.0 or later.

``NormalizerAuto`` supports all encoding. It uses Unicode NFKC
(Normalization Form Compatibility Composition) for UTF-8 encoding
text. It uses encoding specific original normalization for other
encodings. The results of those original normalization are similar to
NFKC.

For example, half-width katakana (such as U+FF76 HALFWIDTH KATAKANA
LETTER KA) + half-width katakana voiced sound mark (U+FF9E HALFWIDTH
KATAKANA VOICED SOUND MARK) is normalized to full-width katakana with
voiced sound mark (U+30AC KATAKANA LETTER GA). The former is two
characters but the latter is one character.

Here is an example that uses ``NormalizerAuto`` normalizer:

.. groonga-command
.. include:: ../example/reference/normalizers/normalizer-auto.log
.. table_create NormalLexicon TABLE_HASH_KEY ShortText --normalizer NormalizerAuto

.. _normalizer-nfkc51:

``NormalizerNFKC51``
^^^^^^^^^^^^^^^^^^^^

``NormalizerNFKC51`` normalizes texts by Unicode NFKC (Normalization
Form Compatibility Composition) for Unicode version 5.1. It supports
only UTF-8 encoding.

Normally you don't need to use ``NormalizerNFKC51`` explicitly. You can
use ``NormalizerAuto`` instead.

Here is an example that uses ``NormalizerNFKC51`` normalizer:

.. groonga-command
.. include:: ../example/reference/normalizers/normalizer-nfkc51.log
.. table_create NFKC51Lexicon TABLE_HASH_KEY ShortText --normalizer NormalizerNFKC51

Additional normalizers
----------------------

There are additional normalizers:

  * `groonga-normalizer-mysql <https://github.com/groonga/groonga-normalizer-mysql>`_

See also
--------

* :doc:`/reference/commands/table_create`
