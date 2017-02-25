ROOT_DIR := $(realpath .)
BIN_DIR := $(ROOT_DIR)/bin
PDF_DIR := $(ROOT_DIR)/pdf
TEMPLATE_DIR := $(ROOT_DIR)/templates

all: $(PDF_DIR)/resume-alternate.pdf $(PDF_DIR)/resume-modern.pdf $(PDF_DIR)/resume.pdf clean

$(PDF_DIR)/resume-alternate.pdf: $(TEMPLATE_DIR)/alternate-cv/resume-alternate.tex 
	@echo "*** Making alternate resume"
	@bash $(BIN_DIR)/make-pdf.sh $(TEMPLATE_DIR)/alternate-cv/resume-alternate.tex || echo 'xelatex exit 1'
	mv $(TEMPLATE_DIR)/alternate-cv/resume-alternate.pdf $@

$(PDF_DIR)/resume-modern.pdf: $(TEMPLATE_DIR)/modern-cv/resume-modern.tex 
	@echo "*** Making modern resume"
	@bash ${BIN_DIR}/make-pdf.sh $(TEMPLATE_DIR)/modern-cv/resume-modern.tex 
	@mv $(TEMPLATE_DIR)/modern-cv/resume-modern.pdf $@

$(PDF_DIR)/resume.pdf: $(TEMPLATE_DIR)/awesome-cv/resume.tex 
	@echo "*** Making default resume"
	@bash ${BIN_DIR}/make-pdf.sh $(TEMPLATE_DIR)/awesome-cv/resume.tex 
	@mv $(TEMPLATE_DIR)/awesome-cv/resume.pdf $@

clean:
	@find $(ROOT_DIR) \( -name "*.log" -o -name "*.out" -o -name "*.aux" \) -type f -delete
	@find $(ROOT_DIR) \( -name "*.fls" -o -name "*.dvi" -o -name "*.fdb_latexmk" \) -type f -delete

.PHONY: clean all