How to build Mongo driver with SSL enabled

1) download the latest version from the mongo c++ driver
https://github.com/mongodb/mongo-c-driver/releases/tag/1.21.1

2) build the driver following the instructions from here
http://mongoc.org/libmongoc/current/installing.html

2.1) add the "-DENABLE_SSL=AUTO" flag to cmake command line to build with SSL support
2.2) add the "-A x64" flag to cmake command line to build for 64 bit

Build with Visual Studio C:
	cd mongo-c-driver-xx
	mkdir cmake-build
	cd cmake-build
	cmake -G "Visual Studio 16 2019" -A x64 "-DCMAKE_INSTALL_PREFIX=C:\mongo-c-driver" "-DCMAKE_PREFIX_PATH=C:\mongo-c-driver" "-DENABLE_SSL=AUTO" -DBSON_OUTPUT_BASENAME=libbson -DMONGOC_OUTPUT_BASENAME=libmongoc ..
	msbuild.exe /p:Configuration=RelWithDebInfo ALL_BUILD.vcxproj

3) generate the server and client certificates following this tutorial: 
https://asciinema.org/a/85126

4) follow the RAD documentation to connect:
https://docwiki.embarcadero.com/RADStudio/Alexandria/en/Connect_to_MongoDB_Database_(FireDAC)
