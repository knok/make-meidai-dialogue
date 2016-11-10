#
#

# download page: https://nknet.ninjal.ac.jp/nuc/templates/nuc.html
CORPUS_URL = https://nknet.ninjal.ac.jp/nuc/nuc.zip
ZIP_FILE = nuc.zip
UNZIP_DIR = nuc
WGET = wget
UNZIP = unzip
PYTHON = python

CONV = mksequence.py
SEQFILE = sequence.txt

all: $(SEQFILE)

clean:
	-rm -r $(UNZIP_DIR)
	rm $(SEQFILE)
clean-all: clean
	rm -f

$(SEQFILE): $(UNZIP_DIR)
	$(PYTHON) $(CONV) > $(SEQFILE)

download: $(ZIP_FILE)

nuc.zip:
	$(WGET) $(CORPUS_URL)

$(UNZIP_DIR): nuc.zip
	$(UNZIP) -x $(ZIP_FILE)
