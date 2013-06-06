BLZip/BLUnZip
=============

A simple C++ wrapper for zlib + minizip

This isn't meant to provide comprehensive support for zip files, 
but something simple to, for example, extract content from a zip file 
for game data, to be directly loaded in to a RAM buffer or std::string.

It should also support password protected zip content as well.

There is preliminary support for Zip/compressing files too, although it
is untested.

--

To configure this, you need to have also downloaded zlib: http://zlib.net/

This was tested with zlib version 1.2.8.

You need to chage the path in the two makefiles under ZLIB_DIR to point to the 
uncompressed zlib source archive.

You first need to build the libMinizip.a file:

-	cd contrib
-	make

Next, you can build your source project. Include BLUnZip.cpp/h in
your project and include zlib and minizip lib with your build (-lz
-lMinizip) Use the main makefile as an example of how to do this.

From the minizip project, the only files we're re-using are ioapi.c,
unzip.c and zip.c  Feel free to just include those (and the .h files
obviously) in your project instead of building the minMinizip.a if
you'd like.  That should work fine.
