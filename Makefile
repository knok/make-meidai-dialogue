#
#

# download page: https://nknet.ninjal.ac.jp/nuc/templates/nuc.html
CORPUS_URL = https://nknet.ninjal.ac.jp/nuc/nuc.zip
WGET = wget
UNZIP = unzip

download: nuc.zip

nuc.zip:
	$(WGET) $(CORPUS_URL)

unzip: nuc.zip
	$(UNZIP) -x nuc.zip
