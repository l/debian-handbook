
dia = $(wildcard *.dia)

all: png pdf

png: $(patsubst %.dia,%.png,$(dia))
pdf: $(patsubst %.dia,%.pdf,$(dia))

eps: $(patsubst %.jpg,%.eps,$(wildcard *.jpg)) $(patsubst %.png,%.eps,$(wildcard *.png)) $(patsubst %.dia,%.eps,$(dia))

define DIA_template
$(1).png: $(1).dia
	dia -t png -s 1024 $$<
endef

%.pdf: %.dia
	dia --filter svg --export floffa.svg $<
	inkscape --file=floffa.svg --without-gui --export-area-drawing --export-pdf=$@

$(foreach d,$(patsubst %.dia,%,$(dia)),$(eval $(call DIA_template,$(d))))

.PHONY: png all
.SUFFIXES: .dia .pdf
