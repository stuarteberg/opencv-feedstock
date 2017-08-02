g++ $RECIPE_DIR/test.cpp -I$PREFIX/include  -L$PREFIX/lib -o test
[ $(./test) != "$PKG_VERSION" ] && exit 1
