.PHONY: all
all: ini ini.bytes

ini: src/turboparse.ml examples/ini.ml 
	ocamlfind ocamlopt -I src/ -I examples/ -o ini src/turboparse.ml examples/ini.ml
	
ini.bytes: src/turboparse.ml examples/ini.ml
	ocamlfind ocamlc -I src/ -I examples/ -o ini.bytes src/turboparse.ml examples/ini.ml