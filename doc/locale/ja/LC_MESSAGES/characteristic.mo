Þ            )   ì            3    a  H  F  ª  ±  ñ
     £      ¾  #   ß  ,     w  0  ?  ¨    è            z  %  !        Â  á  Ñ  O  ³  2       6  &  S     z      h    #   þ  J  "  p  m  /  Þ  Q  !    `#    î%    }(    +     *-  $   ;-     `-  '   |-  ÷  ¤-  F  /  ª  ã0     2     ¦2  .  ¸2    ç4     m6  9  6  µ  ¹8  8  o<  !   ¨=    Ê=  #   Í?  ß   ñ?    Ñ@  9   åB  ·  C    ×D                                                                                                
                       	                   A column-oriented architecture allows Groonga to efficiently process aggregate queries because a column-oriented database, which stores records by column, allows an aggregate query to access only a specified column. On the other hand, an aggregate query on a row-oriented database, which stores records by row, has to access neighbor columns, even though those columns are not required. A database of Groonga can be shared with multiple threads/processes. Also, multiple threads/processes can execute read queries in parallel even when another thread/process is executing an update query because Groonga uses read lock-free data structures. This feature is suited to a real-time application that needs to update a database while executing read queries. In addition, Groonga allows you to build flexible systems. For example, a database can receive read queries through the built-in HTTP server of Groonga while accepting update queries through MySQL. A tokenizer is a module to extract index terms. A Japanese full text search engine commonly uses a word-based tokenizer (hereafter referred to as a word tokenizer) and/or a character-based n-gram tokenizer (hereafter referred to as an n-gram tokenizer). A word tokenizer-based search engine is superior in time, space and precision, which is the fraction of relevant documents in a search result. On the other hand, an n-gram tokenizer-based search engine is superior in recall, which is the fraction of retrieved documents in the perfect search result. The best choice depends on the application in practice. An aggregate query groups search results by specified column values and then counts the number of records in each group. For example, an aggregate query in which a location column is specified counts the number of records per location. Making a graph from the result of an aggregate query against a date column is an easy way to visualize changes over time. Also, a combination of refinement by location and an aggregate query against a date column allows visualization of changes over time in specific location. Thus refinement and aggregation are important to perform data mining. An inverted index is a traditional data structure used for large-scale full text search. A search engine based on inverted index extracts index terms from a document when it is added. Then in retrieval, a query is divided into index terms to find documents containing those index terms. In this way, index terms play an important role in full text search and thus the way of extracting index terms is a key to a better search engine. Characteristics of Groonga Column store and aggregate query Full text search and Instant update Geo-location (latitude and longitude) search Groonga also uses inverted indexes but supports instant updates. In addition, Groonga allows you to search documents even when updating the document collection. Due to these superior characteristics, Groonga is very flexible as a full text search engine. Also, Groonga always shows good performance because it divides a large task, inverted index merging, into smaller tasks. Groonga is a fast and accurate full text search engine based on inverted index. One of the characteristics of Groonga is that a newly registered document instantly appears in search results. Also, Groonga allows updates without read locks. These characteristics result in superior performance on real-time applications. Groonga is also a column-oriented database management system (DBMS). Compared with well-known row-oriented systems, such as MySQL and PostgreSQL, column-oriented systems are more suited for aggregate queries. Due to this advantage, Groonga can cover weakness of row-oriented systems. Groonga library Groonga overview Groonga provides a built-in server command which supports HTTP, the memcached binary protocol and the Groonga Query Transfer Protocol (:doc:`/spec/gqtp`). Also, a Groonga server supports query caching, which significantly reduces response time for repeated read queries. Using this command, Groonga is available even on a server that does not allow you to install new libraries. Groonga provides inverted index-based fast geo-location search, which supports a query to find points in a rectangle or circle. Groonga gives high priority to points near the center of an area. Also, Groonga supports distance measurement and you can sort points by distance from any point. Groonga server Groonga supports both word and n-gram tokenizers. The simplest built-in tokenizer uses spaces as word delimiters. Built-in n-gram tokenizers (n = 1, 2, 3) are also available by default. In addition, a yet another built-in word tokenizer is available if MeCab, a part-of-speech and morphological analyzer, is embedded. Note that a tokenizer is pluggable and you can develop your own tokenizer, such as a tokenizer based on another part-of-speech tagger or a named-entity recognizer. Groonga works not only as an independent column-oriented DBMS but also as storage engines of well-known DBMSs. For example, `Mroonga <http://mroonga.org/>`_ is a MySQL pluggable storage engine using Groonga. By using Mroonga, you can use Groonga for column-oriented storage and full text search. A combination of a built-in storage engine, MyISAM or InnoDB, and a Groonga-based full text search engine is also available. All the combinations have good and bad points and the best one depends on the application. See `related projects <http://groonga.org/related-projects.html>`_ for details. In widely used DBMSs, updates are immediately processed, for example, a newly registered record appears in the result of the next query. In contrast, some full text search engines do not support instant updates, because it is difficult to dynamically update inverted indexes, the underlying data structure. Inverted index and tokenizer Location services are getting more convenient because of mobile devices with GPS. For example, if you are going to have lunch or dinner at a nearby restaurant, a local search service for restaurants may be very useful, and for such services, fast geo-location search is becoming more important. Mroonga storage engine Multi-core processors are mainstream today and the number of cores per processor is increasing. In order to exploit multiple cores, executing multiple queries in parallel or dividing a query into sub-queries for parallel processing is becoming more important. People can collect more than enough data in the Internet era. However, it is difficult to extract informative knowledge from a large database, and such a task requires a many-sided analysis through trial and error. For example, search refinement by date, time and location may reveal hidden patterns. Aggregate queries are useful to perform this kind of tasks. Sharable storage and read lock-free The basic functions of Groonga are provided in a C library and any application can use Groonga as a full text search engine or a column-oriented database. Also, libraries for languages other than C/C++, such as Ruby, are provided in related projects. See `related projects <http://groonga.org/related-projects.html>`_ for details. The basic functions of Groonga are provided in a C library. Also, libraries for using Groonga in other languages, such as Ruby, are provided by related projects. In addition, groonga-based storage engines are provided for MySQL and PostgreSQL. These libraries and storage engines allow any application to use Groonga. See `usage examples <http://groonga.org/users/>`_. Project-Id-Version: 1.2.1
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2015-06-16 18:33+0900
Last-Translator: Kouhei Sutou <kou@clear-code.com>
Language-Team: Japanese
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
 Groonga ãéè¨ã¯ã¨ãªãé«éã«å¦çã§ããçç±ã¯ããã¼ã¿ãã¼ã¹ã®è«çæ§é ã«ã«ã©ã ã¹ãã¢ãæ¡ç¨ãã¦ããããã§ããéè¨ã¯ã¨ãªãåç§ããã®ã¯æå®ãããã«ã©ã ã®ã¿ã§ãããããã«ã©ã åä½ã§ãã¼ã¿ãæ ¼ç´ããåæåã®ãã¼ã¿ãã¼ã¹ã§ã¯ãå¿è¦ãªã«ã©ã ã®ã¿ãç¡é§ãªãèª­ã¿åºãããã¨ãå©ç¹ã¨ãªãã¾ããä¸æ¹ãã¬ã³ã¼ãåä½ã§ãã¼ã¿ãæ ¼ç´ããè¡æåã®ãã¼ã¿ãã¼ã¹ã§ã¯ãé£æ¥ããã«ã©ã ãã¾ã¨ãã¦èª­ã¿åºãã¦ãã¾ããã¨ãæ¬ ç¹ã¨ãªãã¾ãã Groonga ã®ã¹ãã¬ã¼ã¸ã¯ãè¤æ°ã®ã¹ã¬ããã»ãã­ã»ã¹ã§å±æãããã¨ãã§ãã¾ããã¾ããåç§ã­ãã¯ããªã¼ãªãã¼ã¿æ§é ãæ¡ç¨ãã¦ãããããæ´æ°ã¯ã¨ãªãå®è¡ãã¦ããç¶æ³ã§ãåç§ã¯ã¨ãªãå®è¡ãããã¨ãã§ãã¾ããåç§ã¯ã¨ãªãå®è¡ã§ããç¶æãç¶­æããªããæ´æ°ã¯ã¨ãªãå®è¡ã§ããã®ã§ããªã¢ã«ã¿ã¤ã ãªã·ã¹ãã ã«é©ãã¦ãã¾ããããã«ã¯ãMySQL ãä»ãã¦æ´æ°ã¯ã¨ãªãå®è¡ãã¦ããæä¸­ã« Groonga ã® HTTP ãµã¼ããä»ãã¦åç§ã¯ã¨ãªãå®è¡ãããªã©ãå¤å½©ãªéç¨ãå¯è½ã¨ãªã£ã¦ãã¾ãã ãã¼ã¯ãã¤ã¶ã¯ãæå­åããç´¢å¼èªãæãåºãã¢ã¸ã¥ã¼ã«ã§ããæ¥æ¬èªãå¯¾è±¡ã¨ããå¨ææ¤ç´¢ã«ããã¦ã¯ãå½¢æç´ ãç´¢å¼èªã¨ãã¦æãåºãæ¹å¼ã¨æå­ N-gram ãæãåºãæ¹å¼ã®ããããããããã¯ä¸¡æ¹ãç¨ããã®ãä¸è¬çã§ããå½¢æç´ æ¹å¼ã¯æ¤ç´¢æéãç´¢å¼ãµã¤ãºã®é¢ã§åªãã¦ããã»ããæ¤ç´¢çµæã«ä¸è¦ãªææ¸ãå«ã¾ãã«ããã¨ããå©ç¹ãæã£ã¦ãã¾ããä¸æ¹ãN-gram æ¹å¼ã«ã¯æ¤ç´¢æ¼ããçºçãã«ããã¨ããå©ç¹ããããç¶æ³ã«ãã£ã¦é©ããæ¹å¼ãé¸æãããã¨ãæã¾ããã¨ããã¦ãã¾ãã éè¨ã¯ã¨ãªã¨ã¯ãæå®ããã«ã©ã ã®å¤ã«ãã£ã¦ã¬ã³ã¼ããã°ã«ã¼ãåããåã°ã«ã¼ãã«å«ã¾ããã¬ã³ã¼ãã®æ°ãæ±ããã¯ã¨ãªã§ãããã¨ãã°ãå°åã® ID ãæ ¼ç´ãã¦ããã«ã©ã ãæå®ããã°ãå°åæ¯ã®ã¬ã³ã¼ãæ°ãæ±ã¾ãã¾ããæ¥ä»ã®ã«ã©ã ãæå®ããã¨ãã®åºåãã°ã©ãåããã°ãã¬ã³ã¼ãæ°ã®æéå¤åãè¦è¦åãããã¨ãã§ãã¾ããããã«ãå°åã«ããçµãè¾¼ã¿ã¨æ¥ä»ã«å¯¾ããéè¨ã¯ã¨ãªãçµã¿åãããã°ãç¹å®ã®å°åã«ãããã¬ã³ã¼ãæ°ã®æéå¤åãè¦è¦åãã¨ãå¯è½ã§ãããã®ããã«ãå°ºåº¦ãèªç±ã«é¸æãã¦çµãè¾¼ã¿ã»éè¨ã§ãããã¨ã¯ãè¨å¤§ãªæå ±ãæ±ãä¸ã§ã¨ã¦ãéè¦ã«ãªãã¾ãã è»¢ç½®ç´¢å¼ã¯å¤§è¦æ¨¡ãªå¨ææ¤ç´¢ã«ç¨ããããä¼çµ±çãªãã¼ã¿æ§é ã§ããè»¢ç½®ç´¢å¼ãç¨ããå¨ææ¤ç´¢ã¨ã³ã¸ã³ã§ã¯ãææ¸ãè¿½å ããã¨ãã«ç´¢å¼èªãè¨é²ãã¦ãããæ¤ç´¢ããã¨ãã¯ã¯ã¨ãªãç´¢å¼èªã«åå²ãã¦åºç¾ææ¸ãæ±ãã¾ãããã®ãããææ¸ãã¯ã¨ãªããç´¢å¼èªãæãåºãæ¹æ³ãéè¦ã«ãªãã¾ãã Groongaã®ç¹å¾´ ã«ã©ã ã¹ãã¢ã¨éè¨ã¯ã¨ãª å¨ææ¤ç´¢ã¨å³ææ´æ° ä½ç½®æå ±ï¼ç·¯åº¦ã»çµåº¦ï¼æ¤ç´¢ ããã«å¯¾ããè»¢ç½®ç´¢å¼ãç¨ããå¨ææ¤ç´¢ã¨ã³ã¸ã³ã§ãããªãããGroonga ã¯ææ¸ãç­æéã§è¿½å ã»åé¤ãããã¨ãã§ãã¾ãããã®ä¸ãæ´æ°ããªããã§ãæ¤ç´¢ã§ããã¨ããåªããç¹å¾´ãæã£ã¦ãããããå¨ææ¤ç´¢ã¨ã³ã¸ã³ã¨ãã¦ã¯ã¨ã¦ãæè»æ§ãããã¾ããã¾ããè¤æ°ã®è»¢ç½®ç´¢å¼ãçµ±åãããããªéãå¦çãå¿è¦ã¨ããªãã®ã§ãå®å®ãã¦é«ãæ§è½ãçºæ®ãããã¨ãæå¾ã§ãã¾ãã Groonga ã¯è»¢ç½®ç´¢å¼ãç¨ããé«éã»é«ç²¾åº¦ãªå¨ææ¤ç´¢ã¨ã³ã¸ã³ã§ãããç»é²ãããææ¸ãããã«æ¤ç´¢çµæã«åæ ã§ãã¾ããã¾ããåç§ããã­ãã¯ããã«æ´æ°ã§ãããã¨ãããå³ææ´æ°ã®å¿è¦ãªã¢ããªã±ã¼ã·ã§ã³ã«ããã¦ãé«ãæ§è½ãçºæ®ãã¾ãã å¨ææ¤ç´¢ã¨ã³ã¸ã³ã¨ãã¦éçºããã Groonga ã§ãããç¬èªã®ã«ã©ã ã¹ãã¢ãæã¤åæåã®ãã¼ã¿ãã¼ã¹ã¨ãã¦ã®å´é¢ãæã£ã¦ãã¾ãããã®ãããMySQL ã PostgreSQL ãªã©ãæ¢å­ã®ä»£è¡¨çãªãã¼ã¿ãã¼ã¹ãè¦æã¨ããéè¨ã¯ã¨ãªãé«éã«å¦çã§ããã¨ããç¹å¾´ããããçµã¿åããã«ãã£ã¦å¼±ç¹ãè£ããããªä½¿ãæ¹ãã§ãã¾ãã Groonga ã©ã¤ãã©ãª Groonga ã®æ¦è¦ Groonga ã«ã¯ãµã¼ãæ©è½ããããããã¬ã³ã¿ã«ãµã¼ããªã©ã®æ°ããã©ã¤ãã©ãªãã¤ã³ã¹ãã¼ã«ã§ããªãç°å¢ã«ããã¦ãå©ç¨ã§ãã¾ããå¯¾å¿ãã¦ããã®ã¯ HTTPãmemcached binary ãã­ãã³ã«ãããã³Groongaã®ç¬èªãã­ãã³ã«ã§ããGroonga Query Transfer Protocolï¼ :doc:`/spec/gqtp` ï¼ã§ãããµã¼ãã¨ãã¦å©ç¨ããã¨ãã¯ã¯ã¨ãªã®ã­ã£ãã·ã¥æ©è½ãæå¹ã«ãªããããåãã¯ã¨ãªãåãåã£ãã¨ãã¯å¿ç­æéãç­ããªãã¨ããç¹å¾´ãããã¾ãã Groonga ã§ã¯è»¢ç½®ç´¢å¼ãå¿ç¨ãã¦é«éãªä½ç½®æå ±æ¤ç´¢ãå®ç¾ãã¦ãã¾ããç©å½¢ã»åã«ããç¯å²æ¤ç´¢ã«å¯¾å¿ãã¦ããã»ããåºæºç¹ã®è¿ããåªåçã«æ¢ç´¢ããããã¨ãã§ãã¾ããã¾ããè·é¢è¨ç®ããµãã¼ããã¦ããã®ã§ãä½ç½®æå ±æ¤ç´¢ã®çµæãåºæºç¹ããã®è·é¢ã«ãã£ã¦æ´åãããã¨ãå¯è½ã§ãã Groonga ãµã¼ã Groonga ã¯å½¢æç´ æ¹å¼ã¨ N-gram æ¹å¼ã®ä¸¡æ¹ã«å¯¾å¿ãã¦ãã¾ããåæç¶æã§å©ç¨ã§ãããã¼ã¯ãã¤ã¶ã¯ç©ºç½ãåºåãæå­ã¨ãã¦ç¨ããæ¹å¼ã¨ N-gram æ¹å¼ã®ã¿ã§ãããå½¢æç´ è§£æå¨ MeCab ãçµã¿è¾¼ãã ã¨ãã¯ MeCab ã«ããåãã¡æ¸ãã®çµæãç¨ããå½¢æç´ æ¹å¼ãæå¹ã«ãªãã¾ãããã¼ã¯ãã¤ã¶ã¯ãã©ã°ã¤ã³ã¨ãã¦è¿½å ã§ãããããç¹å¾´çãªã­ã¼ã¯ã¼ãã®ã¿ãç´¢å¼èªã¨ãã¦æ¡ç¨ãããªã©ãç¬èªã®ãã¼ã¯ãã¤ã¶ãéçºãããã¨ãå¯è½ã§ãã Groonga ã¯ç¬èªã®ã«ã©ã ã¹ãã¢ãæã¤åæåã®ãã¼ã¿ãã¼ã¹ã¨ãã¦ã®å´é¢ãæã£ã¦ãã¾ãããæ¢å­ã® RDBMS ã®ã¹ãã¬ã¼ã¸ã¨ã³ã¸ã³ã¨ãã¦å©ç¨ãããã¨ãã§ãã¾ãããã¨ãã°ãGroonga ããã¼ã¹ã¨ãã MySQL ã®ã¹ãã¬ã¼ã¸ã¨ã³ã¸ã³ã¨ãã¦ `Mroonga <http://mroonga.org/ja/>`_ ãéçºããã¦ãã¾ããMroonga ã¯ MySQL ã®ãã©ã°ã¤ã³ã¨ãã¦åçã«ã­ã¼ããããã¨ãå¯è½ã§ãããGroonga ã®ã«ã©ã ã¹ãã¢ãã¹ãã¬ã¼ã¸ã¨ãã¦å©ç¨ããããå¨ææ¤ç´¢ã¨ã³ã¸ã³ã¨ãã¦ Groonga ã MyISAM ã InnoDB ã¨é£æºãããããããã¨ãã§ãã¾ããGroonga åä½ã§ã®å©ç¨ãããã³ MyISAM, InnoDB ã¨ã®é£æºã«ã¯ä¸é·ä¸ç­ãããã®ã§ãç¨éã«å¿ãã¦é©åãªçµã¿åãããé¸ã¶ãã¨ãå¤§åã§ããè©³ããã¯ `é¢é£ãã­ã¸ã§ã¯ã <http://groonga.org/ja/related-projects.html>`_ ãåç§ãã¦ãã ããã ä¸è¬çãªãã¼ã¿ãã¼ã¹ã«ããã¦ã¯ãè¿½å ã»åé¤ãªã©ã®æä½ãããã«åæ ããã¾ããä¸æ¹ãå¨ææ¤ç´¢ã«ããã¦ã¯ãè»¢ç½®ç´¢å¼ãéæ¬¡æ´æ°ã®é£ãããã¼ã¿æ§é ã§ãããã¨ãããææ¸ã®è¿½å ã»åé¤ã«å¯¾å¿ããªãã¨ã³ã¸ã³ãå°ãªãããã¾ããã è»¢ç½®ç´¢å¼ã¨ãã¼ã¯ãã¤ã¶ GPS ã«ä»£è¡¨ãããæ¸¬ä½ã·ã¹ãã ãæ­è¼ããé«æ©è½ãªæºå¸¯ç«¯æ«ã®æ®åãªã©ã«ãã£ã¦ãä½ç½®æå ±ãæ±ããµã¼ãã¹ã¯ã¾ãã¾ãä¾¿å©ã«ãªã£ã¦ãã¾ãããã¨ãã°ãè¿ãã«ããã¬ã¹ãã©ã³ãæ¢ãã¦ããã¨ãã¯ãç¾å¨å°ããã®è·é¢ãåºæºã¨ãã¦æ¤ç´¢ããããªããæ¤ç´¢çµæãå°å³ä¸ã«è¡¨ç¤ºãã¦ããããããªãµã¼ãã¹ãä¾¿å©ã§ãããã®ãããä½ç½®æå ±æ¤ç´¢ãé«éã«å®ç¾ã§ãããã¨ãéè¦ã«ãªã£ã¦ãã¾ãã Mroonga ã¹ãã¬ã¼ã¸ã¨ã³ã¸ã³ CPU ã®ãã«ãã³ã¢åãé²ãã§ãããããåæã«è¤æ°ã®ã¯ã¨ãªãå®è¡ããããä¸ã¤ã®ã¯ã¨ãªãè¤æ°ã®ã¹ã¬ããã§å®è¡ããããããã¨ã®éè¦æ§ã¯ã¾ãã¾ãé«ã¾ã£ã¦ãã¾ãã ç¾ä»£ã¯ãã¤ã³ã¿ã¼ããããæå ±æºã¨ããã°ããããã§ãæå ±ãåéã§ããæä»£ã§ããããããè¨å¤§ãªæå ±ããæçãªæå ±ãå¼ãåºãã®ã¯å°é£ã§ãããå¤é¢çãªåæã«ããè©¦è¡é¯èª¤ãå¿è¦ã¨ãªãã¾ãããã¨ãã°ãæ¥ä»ãæéå¸¯ã«ããçµãè¾¼ãã§ã¿ãããå°åã«ããçµãè¾¼ãã§ã¿ãããæ§å¥ãå¹´é½¢ã«ããçµãè¾¼ãã§ã¿ãããããã¨ã§ããããããã¦ããã®ãããªã¨ãã«ä¾¿å©ãªå­å¨ãéè¨ã¯ã¨ãªã§ãã å±æå¯è½ãªã¹ãã¬ã¼ã¸ã¨åç§ã­ãã¯ããªã¼ Groonga ã®åºæ¬æ©è½ã¯ C ã©ã¤ãã©ãªã¨ãã¦æä¾ããã¦ããã®ã§ãä»»æã®ã¢ããªã±ã¼ã·ã§ã³ã«çµã¿è¾¼ãã§å©ç¨ãããã¨ãã§ãã¾ããC/C++ ä»¥å¤ã«ã¤ãã¦ã¯ãRuby ãã Groonga ãå©ç¨ããã©ã¤ãã©ãªãªã©ãé¢é£ãã­ã¸ã§ã¯ãã«ããã¦æä¾ããã¦ãã¾ããè©³ããã¯ `é¢é£ãã­ã¸ã§ã¯ã <http://groonga.org/ja/related-projects.html>`_ ãåç§ãã¦ãã ããã Groonga ã®åºæ¬æ©è½ã¯ C ã©ã¤ãã©ãªã¨ãã¦æä¾ããã¦ãã¾ãããMySQL ã PostgreSQL ã¨é£æºãããããRuby ããå¼ã³åºããããããã¨ãã§ãã¾ãããã®ãããä»»æã®ã¢ããªã±ã¼ã·ã§ã³ã«çµã¿è¾¼ããã¨ãå¯è½ã§ãããå¤æ§ãªä½¿ãæ¹ãèãããã¾ãã èå³ã®ããæ¹ã¯ `å©ç¨ä¾ <http://groonga.org/ja/users/>`_ ããè¦§ãã ããã 