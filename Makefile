.PHONY: all
all: ini.native ini.byte

ini.native: src/turboparse.ml examples/ini.ml 
	ocamlfind ocamlopt -I src/ -I examples/ -o ini.native src/turboparse.ml examples/ini.ml
	
ini.byte: src/turboparse.ml examples/ini.ml
	ocamlfind ocamlc -I src/ -I examples/ -o ini.byte src/turboparse.ml examples/ini.ml