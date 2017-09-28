#
#

# download page: https://nknet.ninjal.ac.jp/nuc/templates/nuc.html
CORPUS_URL = http://mmsrv.ninjal.ac.jp/nucc/nucc.zip
ZIP_FILE = nucc.zip
UNZIP_DIR = nucc
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

nucc.zip:
	$(WGET) $(CORPUS_URL)

$(UNZIP_DIR): nucc.zip
	$(UNZIP) -x $(ZIP_FILE)
