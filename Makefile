.PHONY: all
all: ini.native ini.byte turboparseTest.native turboparseTest.byte

ini.native: src/turboparse.ml examples/ini.ml
	ocamlfind ocamlopt -I src/ -I examples/ -o ini.native src/turboparse.ml examples/ini.ml

ini.byte: src/turboparse.ml examples/ini.ml
	ocamlfind ocamlc -I src/ -I examples/ -o ini.byte src/turboparse.ml examples/ini.ml

turboparseTest.native: src/turboparse.ml tests/turboparseTest.ml
	ocamlfind ocamlopt -I src/ -I tests/ -o turboparseTest.native src/turboparse.ml tests/turboparseTest.ml

turboparseTest.byte: src/turboparse.ml tests/turboparseTest.ml
	ocamlfind ocamlc -I src/ -I tests/ -o turboparseTest.byte src/turboparse.ml tests/turboparseTest.ml

.PHONY: test
test: test.native test.byte

.PHONY: test.native
test.native: turboparseTest.native
	./turboparseTest.native

.PHONY: test.byte
test.byte: turboparseTest.byte
	./turboparseTest.byte